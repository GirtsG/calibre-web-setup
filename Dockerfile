FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Izveidojiet nepieciešamās direktorijas
RUN mkdir -p /config /books

# Eksportējiet portu
EXPOSE 8083
