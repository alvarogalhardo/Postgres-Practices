CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    adress TEXT NOT NULL, 
);

CREATE TABLE "products"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    "category_id" INT NOT NULL REFERENCES "categories"("id"),
    "size_id" INT NOT NULL REFERENCES "sizes"("id"), 
);

CREATE TABLE "sizes"(
    id SERIAL PRIMARY KEY,
    size VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE "categories"(
    id SERIAL PRIMARY KEY,
    categorie VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE "orders"(
    id SERIAL PRIMARY KEY,
    "user_id" INT NOT NULL REFERENCES "users"("id"),
    "products_id" INT NOT NULL REFERENCES "products"("id"),
    status VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    adress TEXT NOT NULL REFERENCES "users"("adress")
);

CREATE TABLE "images"(
    id SERIAL PRIMARY KEY,
    "products_id" INT NOT NULL REFERENCES "products"("id"),
    "main_image" TEXT NOT NULL,
    "image_1" TEXT NOT NULL,
    "image_2" TEXT NOT NULL,
);