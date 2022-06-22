FROM python:alpine 

RUN apk add --no-cache --virtual .build musl-dev linux-headers build-base g++ libgcc libstdc++ openblas && \
    pip install --no-cache-dir -U pip setuptools wheel && \
    pip install --no-cache-dir pandas==1.3.0 && \
    apk del .build

