FROM python:alpine 

ADD requirements.txt .

ENV BUILD_TIME='musl-dev bash libc6-compat linux-headers build-base g++ gcc freetype-dev libpng-dev openblas-dev libgfortran gfortran libgcc libstdc++'
ENV RUN_TIME='musl libgcc libstdc++'

RUN apk add --no-cache --virtual .build $BUILD_TIME
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install --no-cache-dir -U pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt 

RUN apk del .build && \
    apk add --no-cache $RUN_TIME && \
    pip uninstall Cython -y