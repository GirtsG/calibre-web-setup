FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Norādiet, ka izmantojam 8083 portu
EXPOSE 8083
