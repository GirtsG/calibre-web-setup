FROM ghcr.io/linuxserver/calibre-web:latest

# Iestatiet laika zonu
ENV TZ=Europe/Riga

# Izveidojiet nepieciešamās direktorijas
RUN mkdir -p /config /books

# Eksportējiet portu
EXPOSE 8083

# Pievienojiet paroles atiestatīšanas skriptu
RUN echo "import time; import sqlite3; time.sleep(10); conn = sqlite3.connect('/config/app.db'); conn.execute(\"UPDATE users SET password='pbkdf2:sha256:150000$1234abcd$5e88607e3019c1ad8ebd345ff17c0f81c4cba27ad5d3c02e49089d202c7b2e65' WHERE username='admin';\"); conn.commit(); conn.close()" > /reset_password.py

# Palaidiet Calibre-Web un pēc tam izpildiet skriptu
CMD ["sh", "-c", "/usr/bin/python3 /reset_password.py & /usr/bin/run"]
