# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app

# CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "oc_lettings_site.wsgi:application"]
CMD gunicorn oc_lettings_site.wsgi:application --bind 0.0.0.0:$PORT