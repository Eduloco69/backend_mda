# Backend Mesa de Ayuda

## Antes de ejecutar

Tener instalado los siguientes programas

* Docker
* Python

Escribir el siguiente comando para clonar el .env

```bat
cp .env.example .env
```

Entra al archivo ``.env`` y modifica la variable ``DB_PASSWORD`` para cambiar la contraseña de la BD

## Para ejecutar

En la terminal usa el comando 

```bat
docker compose up --build
```
Y automaticamente se levantarán todos los servicios.

## Ejecutar cada servicio por separado

Base de datos
```bat
docker compose up db --build
```

Auth-service
```bat
docker compose up auth-service --build
```