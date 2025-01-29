-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--Retrieve all albums created by a specific artist (e.g., artist with ID = 1)
SELECT "title", "release_year", "format", "price", "stock"
FROM "albums"
WHERE "artist_id" = 1;

-- Find all songs in a specific album (e.g., album with ID = 3)
SELECT "title", "duration", "track_number"
FROM "songs"
WHERE "album_id" = 3
ORDER BY "track_number";

-- Calculate total sales for a specific album (e.g., album with ID = 5)
SELECT "album_id", SUM("quantity") AS 'total_quantity', SUM("total_amount") AS 'total_revenue'
FROM "sales"
WHERE "album_id" = 5
GROUP BY "album_id";

-- List all artists and the number of albums they have released
SELECT "artists"."name" AS 'artist_name', COUNT("albums"."id") AS 'total_albums'
FROM "artists"
JOIN "albums" ON "artists"."id" = "albums"."artist_id"
GROUP BY "artists"."name"
ORDER BY "total_albums" DESC;

-- Get the most recent album released by each artist
SELECT "artists"."name" AS 'artist_name', "albums"."title" AS 'latest_album', MAX("albums"."release_year") AS 'release_year'
FROM "artists"
JOIN "albums" ON "artists"."id" = "albums"."artist_id"
GROUP BY "artists"."name", "albums"."title"
ORDER BY "release_year" DESC;

-- Find the top 10-selling albums based on total revenue
SELECT "albums"."title" AS "album_title", SUM("sales"."total_amount") AS 'total_revenue'
FROM "albums"
JOIN "sales" ON "albums"."id" = "sales"."album_id"
GROUP BY "albums"."title"
ORDER BY "total_revenue" DESC
LIMIT 10;

-- Calculate the total duration of all songs in a specific album (e.g., album with ID = 4)
SELECT "albums"."title" AS "album_title", SUM("songs"."duration") AS 'total_duration'
FROM "songs"
JOIN "albums" ON "songs"."album_id" = "albums"."id"
WHERE "albums"."id" = 4
GROUP BY "albums"."title";

-- Find the artist whose albums generated the highest total revenue
SELECT "artists"."name", SUM("sales"."total_amount") AS 'total_revenue'
FROM "artists"
JOIN "albums" ON "artists"."id" = "albums"."artist_id"
JOIN "sales" ON "albums"."id" = "sales"."album_id"
GROUP BY "artists"."name"
ORDER BY "total_revenue" DESC
LIMIT 1;
