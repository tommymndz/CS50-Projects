CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "school_name" TEXT,
    "school_type" TEXT CHECK("school_type" IN ('Elementary School', 'Middle School', 'High School', 'Lower School', 'Upper School', 'College', 'University')),
    "school_location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "company_name" TEXT,
    "company_industry" TEXT CHECK("company_industry" IN ('Education', 'Technology', 'Finance')),
    "company_location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "users_connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY("user1_id", "user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

CREATE TABLE "schools_connections" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "affiliation_date" NUMERIC,
    "end_affiliation_date" NUMERIC,
    "degree_type" TEXT CHECK("degree_type" IN ('BA', 'MA', 'PhD')),
    PRIMARY KEY("user_id", "school_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "companies_connections" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "affilitation_date" NUMERIC,
    "end_affiliation_date" NUMERIC,
    "title" TEXT,
    PRIMARY KEY("user_id", "company_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
