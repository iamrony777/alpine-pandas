FROM python:alpine 

RUN apk add --no-cache --virtual .build musl-dev linux-headers build-base g++ libgcc libstdc++ openblas && \
    pip install --no-cache-dir -U pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build

