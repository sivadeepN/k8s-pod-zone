FROM alpine:latest
ARG TARGETPLATFORM=linux/amd64

RUN apk add --update curl && rm -rf /var/cache/apk/*

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

COPY script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/bin/sh", "-c", "/script.sh"]
