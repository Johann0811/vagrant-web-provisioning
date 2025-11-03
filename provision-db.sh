#debes completar este archivo con los comandos necesarios para provisionar la base de datos

#!/usr/bin/env bash

# Actualizar paquetes
sudo apt-get update -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Habilitar PostgreSQL
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Crear base de datos, usuario y tabla con datos
sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';" || true
sudo -u postgres psql -c "ALTER USER vagrant WITH SUPERUSER;" || true
sudo -u postgres psql -c "CREATE DATABASE juegosDB OWNER vagrant;" || true

# Crear tabla de datos
sudo -u postgres psql -d juegosdb -c "
CREATE TABLE juegos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    precio INT
);
INSERT INTO juegos (nombre, precio) VALUES
('Hitman 3', 60),
('Street fighter 6', 60),
('Marvel vs Capcom 3', 25),
;"
