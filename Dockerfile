FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/* \
    apt-get install make

RUN apt-get update && apt-get install -y python3-pip

RUN mkdir /app
WORKDIR /app

COPY luci/requirements/common.txt .

RUN pip3 install -r common.txt
RUN python3 -m spacy download pt

COPY . .


ENV NAME luci
