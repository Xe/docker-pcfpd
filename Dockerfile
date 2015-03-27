FROM alpine

RUN apk update && apk add alpine-sdk

RUN git clone https://github.com/PonyChat/pcfpd /root/pcfpd &&\
    cd /root/pcfpd && make && cp pcfpd /usr/bin && cp policy-example.xml /policy.xml

RUN adduser -h /home/fpd -s /bin/sh -D fpd

USER fpd
EXPOSE 8430

CMD /usr/bin/pcfpd -f /policy.xml -p 8430
