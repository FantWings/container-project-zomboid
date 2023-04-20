echo "------------ PREPARE RUNTIME ENV ------------"
export INSTDIR="/serverfiles"
export PATH="${INSTDIR}/jre64/bin:$PATH"
export JSIG="libjsig.so"
export LD_LIBRARY_PATH="${INSTDIR}/linux64:${INSTDIR}/natives:${INSTDIR}:${INSTDIR}/jre64/lib/amd64:${LD_LIBRARY_PATH}"
LD_PRELOAD="${LD_PRELOAD}:${JSIG}"
echo "------------ RUNTIME ENV SETED ------------"

echo "------------ CHECKING FOR UPDATES ------------"
steamcmd +force_install_dir "${INSTDIR}" /serverfiles +login anonymous +app_update 380870 +quit
echo "------------ UPDATES CHECKED ------------"

echo "------------ STARTING SERVER ------------"
awk '/-Dzomboid.znetlog=1/ { print; print "\"-Duser.language=cn\","; print "\"-Duser.region=CN\","; next }1' ProjectZomboid64.json > temp.json && mv temp.json ProjectZomboid64.json
exec ./ProjectZomboid64 "$STARTUP_ARGS"
