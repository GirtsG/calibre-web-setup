FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Kopējiet konfigurācijas datubāzi
COPY config/app.db /config/app.db

# Parādiet konfigurācijas saturu diagnostikai
RUN ls -al /config

# Eksponē vajadzīgo portu
EXPOSE 8083

# Startējiet Calibre-Web manuāli
CMD ["python3", "/app/calibre-web/cps.py"]
