FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Kopējiet datubāzi konteinerī
COPY config/app.db /config/app.db

# Eksportējiet portu
EXPOSE 8083

CMD ["/usr/bin/run"]
