FROM alpine:latest

ENV PORT        4000
ENV KEY         68222e61-ce25-4e34-aa60-e59bdac48f45
ENV SPATH       /wspx
ENV REDIRECT    https://google.com

ENV USER        4040

COPY ./overlay /

RUN apk add --no-cache tmux ttyd curl jq nodejs npm && \
    npm -g i zx && adduser -u ${USER} -G root -S project && \
    mv /usr/bin/xray /usr/bin/project && chmod a+x /etc/init /usr/bin/project && \
    chmod 775 /home/project

WORKDIR /home/project

EXPOSE ${PORT}

CMD /etc/init

USER xray
