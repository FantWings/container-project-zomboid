FROM steamcmd/steamcmd:latest

VOLUME /serverfiles
VOLUME /steamcmd

ENV USER=1000
ENV HOME=/steamcmd
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV TZ=Asia/Shanghai

RUN mkdir /steamcmd && chown 1000 /steamcmd
COPY ./docker-entrypoint.sh /

USER 1000
WORKDIR /serverfiles


EXPOSE 16261/udp
EXPOSE 16262/udp
ENTRYPOINT ["bash","/docker-entrypoint.sh"]
