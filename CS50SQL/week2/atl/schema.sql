CREATE TABLE "Passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check-ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" NUMERIC,
    "airline_id" INTEGER,
    "from_airport" TEXT,
    "to_airport" TEXT,
    "departure_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id")
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
