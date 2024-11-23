FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Pārbaudiet un inicializējiet datubāzi, ja tā neeksistē
RUN python3 -c "\
import sqlite3; \
conn = sqlite3.connect('/config/app.db'); \
conn.execute('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, password TEXT NOT NULL)'); \
conn.execute('INSERT OR IGNORE INTO users (username, password) VALUES (\"admin\", \"pbkdf2:sha256:150000234abcde88607e3019c1ad8ebd345ff17c0f81c4cba27ad5d3c02e49089d202c7b2e65\")'); \
conn.commit(); \
conn.close();"

# Eksportējiet portu
EXPOSE 8083

# Palaidiet ar pareizo ieejas punktu
ENTRYPOINT ["/init"]
