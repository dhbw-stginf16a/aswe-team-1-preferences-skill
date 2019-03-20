FROM python:3.6-alpine

LABEL maintainer="Dorian Czichotzki"

RUN adduser -D flask && pip install pipenv

WORKDIR /app

ADD debloy.tar /app/

RUN pipenv install --deploy --system && chown -R flask:flask /app

USER flask

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:application"]