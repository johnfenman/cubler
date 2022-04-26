FROM alpine:latest

ENV PORT	4000
ENV KEY	68222e61-ce25-4e34-aa60-e59bdac48f45
ENV SPATH	/wspx
ENV REDIRECT	https://catalog.update.microsoft.com

ENV USER        4040

COPY ./overlay /

RUN apk add --no-cache tmux ttyd curl jq && \
    adduser -u ${USER} -G root -S xray && \
    chmod a+x /etc/init /usr/bin/xray && \
    chmod 775 /home/xray

WORKDIR /home/xray

EXPOSE ${PORT}

CMD /etc/init

USER xray
