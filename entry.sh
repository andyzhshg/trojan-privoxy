#!/bin/sh

privoxy --no-daemon /etc/privoxy/config &

jq ".remote_addr|=\"${REMOTE_ADDR}\"" /trojan/examples/client.json-example | \
    jq ".password[0]|=\"${PASSWORD}\"" | \
    jq ".local_port|=1086" | \
    jq ".local_addr|=\"0.0.0.0\"" \
    > /trojan/client.json

/trojan/trojan --config=/trojan/client.json
