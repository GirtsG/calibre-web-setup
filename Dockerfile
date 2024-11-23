FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Pievienojiet iepriekš izveidotu datubāzes failu
COPY config/app.db /config/app.db

# Eksportējiet portu
EXPOSE 8083

# Palaidiet ar pareizo ieejas punktu
CMD ["/init"]
