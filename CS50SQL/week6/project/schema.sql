-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent the Artists
CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "genre" TEXT,
    "country" TEXT NOT NULL,
    "debut_year" INT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the albums in the store
CREATE TABLE "albums" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "release_year" INT NOT NULL,
    "artist_id" INTEGER,
    "format" TEXT CHECK("format" IN ('cd', 'vinyl')),
    "price" NUMERIC NOT NULL,
    "stock" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Represent songs included in each album
CREATE TABLE "songs" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "duration" TIME NOT NULL,
    "album_id" INTEGER,
    "artist_id" INTEGER,
    "track_number" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Represent individual album sales
CREATE TABLE "sales" (
    "id" INTEGER,
    "album_id" INTEGER,
    "sale_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity" INTEGER NOT NULL,
    "total_amount" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id")
);

-- Create indexes to speed common searches

CREATE INDEX "idx_albums_artist_id" ON "albums" ("artist_id");
--Reason: This index will improve queries that frequently filter or join on artist_id, such as retrieving all albums by a specific artist.

CREATE INDEX "idx_sales_album_id" ON "sales" ("album_id");
--Reason: This index will optimize queries that calculate sales totals or filter sales by album, such as queries to determine the total revenue or sales of specific albums.

CREATE INDEX "idx_songs_album_id_track_number" ON "songs" ("album_id", "track_number");
--Reason: This composite index will improve queries that retrieve songs from a specific album in order by track number, which is common when displaying album details with song listings.

