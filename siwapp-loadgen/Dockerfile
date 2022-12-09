FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "-u", "siwapp-load.py"]