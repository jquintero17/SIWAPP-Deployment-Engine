from requests import Session
import re
from pyVim.connect import SmartConnect, Disconnect
import ssl
from time import sleep
from os import getenv
from random import randint

__csrf_match = re.compile('name=\"signin\[_csrf_token\]\" value=\"(.*)\" id')
__paths = ['dashboard', 'invoices', 'customers', 'estimates']

def login(session, ip):
    r = session.get('http://{}'.format(ip))
    tokens = __csrf_match.findall(r.text)
    data = {
        'signin[_csrf_token]': tokens[0],
        'signin[username]': __siwapp_user,
        'signin[password]': __siwapp_pw
    }
    r = session.post('http://{}'.format(ip), data=data, timeout=4)
    print('Login attempt status: {}'.format(r.status_code))


def get_vm_info(vm, depth=1):
    """
    Print information for a particular virtual machine or recurse into a folder
    or vApp with depth protection
    """
    vm_ips = []

    maxdepth = 10
    # if this is a group it will have children. if it does, recurse into them
    # and then return
    if hasattr(vm, 'childEntity'):
        if depth > maxdepth:
            return vm_ips
        children = vm.childEntity
        for c in children:
            vm_ips = vm_ips + get_vm_info(c, depth+1)
        return vm_ips

    try:
        name = vm.config.name
    except:
        name = None

    if __vm_name_filter in name:
        try:
            for nic in vm.guest.net:
                for ipAddress in nic.ipConfig.ipAddress:
                    vm_ips.append((name, ipAddress.ipAddress))
        except:
            try:
                print('Rebooting VM {} due to IP address error'.format(name))
                vm.RebootGuest()
            except:
                print('Reboot attempt failed')

    return vm_ips


def get_vms():
    context = ssl._create_unverified_context()
    si = SmartConnect(host=__vc_url, user=__vc_user,
                      pwd=__vc_pw, port='443', sslContext=context)
    content = si.RetrieveContent()

    vm_ips = []
    for child in content.rootFolder.childEntity:
        if hasattr(child, 'vmFolder'):
            datacenter = child
            vmFolder = datacenter.vmFolder
            vmList = vmFolder.childEntity
            for vm in vmList:
                vm_ips = vm_ips + get_vm_info(vm)

    Disconnect(si)
    return vm_ips


def main():
    """
    Main execution routine
    """
    global __vc_url
    global __vc_user
    global __vc_pw
    global __vm_name_filter
    global __siwapp_user
    global __siwapp_pw
    global __request_delay
    global __timeout

    __vc_url = getenv('VC_URL')
    __vc_user = getenv('VC_USER')
    __vc_pw = getenv('VC_PW')
    __vm_name_filter = getenv('VM_NAME_FILTER')
    __siwapp_user = getenv('SIWAPP_USER')
    __siwapp_pw = getenv('SIWAPP_PW')
    __request_delay=randint(1,5)
    __timeout=randint(3,6)

    print('Delay between attempts will be: {}'.format(__request_delay))
    print('Request Timeout will be: {}'.format(__timeout))

    sessions = {}

    while True:
        print('Gathering VMs')
        targets = get_vms()
        ips = set([x[1] for x in targets])

        for delta in set(sessions.keys()) - ips:
            print('Removing session', delta)
            del sessions[delta]

        for path in __paths:
            for ip in ips:
                print('Trying: http://{}/{}'.format(ip, path))
                if ip not in sessions:
                    session = Session()
                    sessions[ip] = session
                else:
                    session = sessions[ip]
                try:
                    r = session.get('http://{}/{}'.format(ip, path), timeout=__timeout)
                    print('http://{}/{} {}'.format(ip, path, r.status_code))
                    if r.status_code == 401:
                        login(session, ip)
                except:
                    print('Timed out.')
                sleep(__request_delay)


if __name__ == '__main__':
    main()
