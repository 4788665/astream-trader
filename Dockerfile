FROM python:3.9.0

WORKDIR /astream/astream-trader

COPY docker/ta-lib-0.4.0-src.tar.gz .
RUN tar -zxvf ta-lib-0.4.0-src.tar.gz \
    && cd ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install

RUN /usr/local/bin/python -m pip install --upgrade pip
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt 
