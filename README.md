# trojan-privoxy

trojan client with privoxy for http proxy

## How to use

```bash
docker run \
    --name trojan-proxy \
    -e REMOTE_ADDR="your host" \
    -e PASSWORD="your password" \
    -p trojan_port:1086 \
    -p privoxy_port:1087 \
    -d \
    andyzhshg/trojan-privoxy
```
