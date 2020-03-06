FROM ubuntu:18.04

RUN apt-get update && apt-get install -y privoxy jq wget xz-utils
RUN wget https://github.com/trojan-gfw/trojan/releases/download/v1.14.1/trojan-1.14.1-linux-amd64.tar.xz && tar xvJf trojan-1.14.1-linux-amd64.tar.xz && rm trojan-1.14.1-linux-amd64.tar.xz
RUN cp /trojan/examples/client.json-example /trojan/client.json


ADD privoxy.config /etc/privoxy/config
ADD entry.sh /entry.sh

RUN chmod +x /entry.sh

EXPOSE 1086/tcp
EXPOSE 1087/tcp

CMD [ "/entry.sh" ]
