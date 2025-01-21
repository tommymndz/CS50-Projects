CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "unit" TEXT,
    "price_per_unit" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "name" TEXT UNIQUE,
    "gluten_free" TEXT CHECK("glute_free" IN ('yes', 'not')),
    "price_per_donut" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts_orders" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quatity" INTEGER,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
