FROM alpine

RUN apk update && apk add alpine-sdk

RUN git clone https://github.com/PonyChat/pcfpd /root/pcfpd &&\
    cd /root/pcfpd &&\
    git checkout 0be7b1b6d11eef0a39e6e9d1176985ae16789dc6 &&\
    make && cp pcfpd /usr/bin

RUN adduser -h /home/fpd -s /bin/sh -D fpd

USER fpd
EXPOSE 8430

ADD policy.xml /policy.xml

CMD /usr/bin/pcfpd -f /policy.xml -p 8430
