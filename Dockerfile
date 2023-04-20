FROM steamcmd/steamcmd:latest

VOLUME /serverfiles
VOLUME /steamcmd

ENV INSTDIR=/serverfiles \
    PATH="${INSTDIR}/jre64/bin:$PATH" \
    JSIG="libjsig.so" \
    PUID=1000 \
    HOME=/steamcmd \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh \
    TZ=Asia/Shanghai \
    STARTUP_ARGS=""

RUN chown $USER /steamcmd
COPY ./docker-entrypoint.sh /

USER ${PUID}
WORKDIR /serverfiles

ENTRYPOINT ["bash","/docker-entrypoint.sh"]
