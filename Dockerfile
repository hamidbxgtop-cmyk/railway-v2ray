FROM alpine:latest

RUN apk add --no-cache curl unzip

# download xray
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /tmp/xray \
    && mv /tmp/xray/xray /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray \
    && rm -rf /tmp/xray /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 80 443

CMD ["/usr/local/bin/xray", "run", "-config", "/etc/xray/config.json"]
