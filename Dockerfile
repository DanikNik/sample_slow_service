FROM python:latest

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY config.py ./config.py
COPY main.py ./main.py

ENTRYPOINT gunicorn main:app --bind 0.0.0.0:8000 -w 4 --threads 100
EXPOSE 8000