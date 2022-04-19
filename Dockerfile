FROM python:3.9-alpine

RUN mkdir /src 

WORKDIR /src

COPY requirements.txt requirements.txt

RUN  apk update \
     && apk add python3 postgresql-libs \
     && apk add --update --no-cache --virtual .build-deps alpine-sdk python3-dev musl-dev postgresql-dev libffi-dev \
     && pip install -U setuptools pip \
     && pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mv src/main.py .

CMD ["python","main.py"]

