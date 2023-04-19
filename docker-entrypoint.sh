steamcmd +force_install_dir /serverfiles +login anonymous +app_update 380870 validate +quit
cp /serverfiles/ProjectZomboid64.json.bak /serverfiles/ProjectZomboid64.json
exec /serverfiles/start-server.sh 
