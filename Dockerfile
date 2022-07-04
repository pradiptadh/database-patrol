FROM mysql:8.0.29

COPY askara-palm-patrol/*.sql /docker-entrypoint-initdb.d/

