#!/bin/bash

# Generar una clave base64 para el Replica Set
openssl rand -base64 756 > /data/keyfile.key

# Asegurar los permisos correctos
chmod 400 /data/keyfile.key
chown mongodb:mongodb /data/keyfile.key

# Iniciar MongoDB con Replica Set
/usr/local/bin/docker-entrypoint.sh mongod --replSet rs0 --keyFile /data/keyfile.key --bind_ip_all --auth
