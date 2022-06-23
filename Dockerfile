FROM python:alpine 

ADD requirements.txt .

ENV BUILD_TIME='musl-dev libc6-compat linux-headers build-base g++ gcc freetype libgfortran gfortran libgcc libstdc++ openblas tcl tk'

ENV RUN_TIME='musl libgcc libstdc++'

RUN apk add --no-cache --virtual .build $BUILD_TIME
RUN pip install --no-cache-dir -U pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt && \
    apk del .build && \
    apk add --no-cache $RUN_TIME
