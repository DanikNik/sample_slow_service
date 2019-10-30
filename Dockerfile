FROM python:3.7

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY main.py ./main.py

ENTRYPOINT gunicorn main:app_dispatched --bind 0.0.0.0:8000 --threads 100
EXPOSE 8000