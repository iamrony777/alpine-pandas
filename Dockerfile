FROM python:alpine 

ENV BUILD_TIME='musl-dev libc6-compat linux-headers build-base g++ freetype libgfortran libgcc libstdc++ openblas tcl tk'

ENV RUN_TIME='musl libgcc libstdc++'

RUN apk add --no-cache --virtual .build $BUILD_TIME && \
    pip install --no-cache-dir -U pip setuptools wheel && \
    pip install --no-cache-dir pandas && \
    apk del .build && \
    apk add --no-cache $RUN_TIME

