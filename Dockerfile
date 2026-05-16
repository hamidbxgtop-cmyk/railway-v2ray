FROM alpine:latest

RUN apk add --no-cache curl unzip

WORKDIR /xray

RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && rm xray.zip \
    && chmod +x xray

COPY config.json /etc/xray/config.json

EXPOSE 80 443

CMD ["/xray/xray", "run", "-config", "/etc/xray/config.json"]
