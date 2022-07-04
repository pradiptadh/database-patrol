# Database Patrol
Repository to hold Database Schemas for Askara Projects

## Contents
---
- ### Database Patrol
    - [Contents](##contents)
    - [Quickstart](##quickstart)

## Quickstart
---
To start this database makesure you have docker installed in your system
### 1. Build Docker Image

```docker
$ docker build -t {IMAGE_NAME} .
```
### 2. Run Docker Container
Create an env file with the following attributes and name it `.env`

```bash
MYSQL_ROOT_PASSWORD={your_password}
MYSQL_DATABASE={database_name}
```
Run the following command to run docker container
```docker
$ docker run -d -p {DESIRED_PORT}:3306 -v {FILE_LOCATION}:/var/lib/mysql --env-file .env --name {CONTAINER_NAME} {IMAGE_NAME} 
```
