CREATE DATABASE "curso";

CREATE TABLE "alunos"(
    id SERIAL PRIMARY KEY NOT NULL,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL
);

CREATE TABLE "turmas"(
    id SERIAL PRIMARY KEY NOT NULL,
    codigo VARCHAR(4) NOT NULL
);

CREATE TABLE "turmas_alunos"(
    id SERIAL PRIMARY KEY NOT NULL,
    "alunoId" INTEGER NOT NULL REFERENCES "alunos"("id"),
    "turmaId" INTEGER NOT NULL REFERENCES "turmas"("id"),
    "dataEntrada" DATE NOT NULL DEFAULT NOW(),
    "dataSaida" DATE
);

CREATE TABLE "modulos"(
    id SERIAL PRIMARY KEY NOT NULL,
    nome TEXT NOT NULL
);

CREATE TYPE nota_projeto AS ENUM ('Acima das expectatvias','Abaixo das expectativas','Dentro das expectativas');

CREATE TYPE happiness AS ENUM ('happy', 'very happy', 'ecstatic');

CREATE TABLE "projetos"(
    id SERIAL PRIMARY KEY NOT NULL,
    "alunoId" INTEGER NOT NULL REFERENCES "alunos"("id"),
    data DATE NOT NULL DEFAULT NOW(),
    nota nota_projeto NOT NULL,
    "moduloId" INTEGER NOT NULL REFERENCES "modulos"("id")
);