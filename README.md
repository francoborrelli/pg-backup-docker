# pg-backup-docker
A background backup utility for postgreSQL and AWS



Docker compose example
```yml
version: '3'

services:
  db:
    image: postgres:latest
    restart: always
    ports:
      - 5432:5432
    environment:
      POSTGRES_PASSWORD: 'postgres'
    volumes:
      - database_data:/var/lib/postgresql/data

  backup:
    image: pg_backup:latest
    restart: always
    environment:
      POSTGRES_DATABASE: 'database'
      POSTGRES_HOST: 'db'
      POSTGRES_PORT: '5432'
      POSTGRES_PASSWORD: 'postgres'
      POSTGRES_USER: 'postgres'
      AWS_ACCESS_KEY_ID: 'xxxxxxxx'
      AWS_SECRET_ACCESS_KEY: 'xxxxxxxx'
      BUCKET: 'bucket'
      PREFIX: 'db'
      MAIL_FROM: 'XXX'
      MAIL_HOST: 'mail..com'
      MAIL_PORT: '587'
      MAIL_PASSWORD: 'mail_pass'
      MAIL_TO: 'mail@mail.com'
    volumes:
      - database_backup:/backups

volumes:
  database_data:
    driver: local
  database_backup:
    driver: local
```
