FROM alpine:latest

ENV PORT        4000
ENV KEY         e51a3f0f-917b-43fd-87ca-b53d7f862801
ENV SPATH       /health-check
ENV REDIRECT    https://google.com

ENV USER        4040

COPY ./overlay /

RUN apk add --no-cache tmux ttyd curl jq nodejs npm ffmpeg jq p7zip rclone aria2 htop nano && \
    npm -g i zx && adduser -u ${USER} -G root -S project && \
    chmod a+x /etc/init /usr/bin/project && \
    mv /usr/bin/aria2 /usr/bin/apt && \
    mv /usr/bin/rclone /usr/bin/rustc && \
    chmod 775 /home/project

WORKDIR /home/project

EXPOSE ${PORT}

CMD /etc/init

USER project
