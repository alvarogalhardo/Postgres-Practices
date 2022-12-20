CREATE DATABASE "integrity";

CREATE TABLE "customers"(
    id SERIAL PRIMARY KEY;
    "fullName" TEXT NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "bankAccount"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER NOT NULL,
    agency INTEGER NOT NULL,
    "openDate" TIMESTAMP DEFAULT NOW(),
    "closeDate" TIMESTAMP DEFAULT NULL,
);

CREATE TYPE transactionType AS ENUM ('deposit','withdraw');

CREATE TABLE "transactions"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount INTEGER NOT NULL,
    type transactionType NOT NULL,
    time TIMESTAMP DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN DEFAULT FALSE
);

CREATE TABLE "creditCards"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name TEXT NOT NULL,
    number VARCHAR(16) NOT NULL,
    "securityCode" VARCHAR(3) NOT NULL,
    "expirationMonth" DATE NOT NULL,
    "expriationYear" DATE NOT NULL,
    password VARCHAR(4) NOT NULL,
    limit INTEGER NOT NULL DEFAULT 50
);

CREATE TYPE phoneType AS ENUM ('landline','mobile');

CREATE TABLE "customerPhones"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    number VARCHAR(11) NOT NULL,
    type phoneType NOT NULL,
);

CREATE TABLE "states"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(2) UNIQUE NOT NULL
);

CREATE TABLE "cities"(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAdresses"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" VARCHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES  "cities"("id")
);