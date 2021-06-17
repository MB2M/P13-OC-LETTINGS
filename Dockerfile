# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV DEBUG=False
ENV ALLOWED_HOSTS=127.0.0.1
ENV SECRET_KEY=abc
ENV SENTRY_DSN=https://fbfc78e7272d4c7eb1ef8f7a80d821b4@o761570.ingest.sentry.io/5793114

# Install pip requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]