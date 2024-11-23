FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Inicializējiet nepieciešamās mapes
RUN mkdir -p /config /books

# Nodrošiniet, ka datubāze ir pievienota
COPY config/app.db /config/app.db

# Parādiet failu sarakstu konfigurācijas mapē diagnostikai
RUN ls -al /config

# Iestatiet starta punktu manuāli
CMD ["python3", "/app/calibre-web/cps.py"]
