CREATE DATABASE "agencia";

CREATE TABLE "companias"(
    id SERIAL PRIMARY KEY NOT NULL,
    sigla VARCHAR(3) UNIQUE NOT NULL,
    nome TEXT UNIQUE NOT NULL
);

CREATE TABLE "aeroportos"(
    id SERIAL PRIMARY KEY NOT NULL,
    sigla VARCHAR(3) UNIQUE NOT NULL,
    nome TEXT UNIQUE NOT NULL
);

CREATE TABLE "voos"(
    id SERIAL PRIMARY KEY NOT NULL,
    "companiaId" INTEGER NOT NULL REFERENCES "companias"("id"),
    sigla VARCHAR(3) UNIQUE NOT NULL,
    "saidaId" INTEGER NOT NULL REFERENCES "aeroportos"("id"),
    "chegadaId" INTEGER NOT NULL REFERENCES "aeroportos"("id"),
    "horaSaida" TIMESTAMP NOT NULL DEFAULT NOW(),
    "horaChegada" TIMESTAMP NOT NULL
)