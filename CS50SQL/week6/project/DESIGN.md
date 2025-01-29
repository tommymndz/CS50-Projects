# Design Document

By Tomás Méndez

Video overview: <https://youtu.be/LpDoJSmLTfw>

## Scope

my CS50 SQL database simulates a music store, which sells albums of different artists in CD and vinyl format. As such, included in the database's scope is:

- Artists, including name, music genre, country and debut_year
- Albums, including basic information of the album created by an artist
- Songs, which are the songs included in a specific album
- Sales, which represent every Sale involved to each album (can be 1 or more sales of the same album)

## Functional Requirements

users could search for an album of their choice, find information about the artist who composed it as well as the list of songs contained in the album.
users could also look for the price list of each album.
users could filter the information by Genre if they dont know which album to buy but they like a specific music genre.


## Representation

Entities are captured in SQLite tables with the following schema.


### Entities

The database includes the following entities:

#### Artists

The `Artists` table includes:

* `id`, which specifies the unique ID for the artist as an `INTEGER`. This column thus has the PRIMARY KEY constraint applied.
* `name`, which specifies the artist's name as `TEXT`, given TEXT is appropriate for name fields.
* `genre`, which specifies the artist's music genre. `TEXT` is used for the same reason as "name".
* `country`, which specifies the artist's country. `TEXT` is used for the same reason as "name".
* `debut_year`, which specifies when the artist began to play music.


#### Albums

The `Albums` table includes:

* `id`, which specifies the unique ID for the artist as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `title`, which specifies the album's name as `TEXT`, given TEXT is appropriate for title fields.
* `release_year`, which specifies the year when the album was released.
* `artist_id`, which is the ID of the artist as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `Artists` table to ensure data integrity.
* `format`, which specifies in what format is the album in and can it be on CD or Vinyl.
* `price`, which is the price of each album representated by `NUMERIC` Value.
* `stock`, which represent the quatity of albums that the store has in stock.


#### Songs

The `Songs` table includes:

* `id`, which specifies the unique ID for the artist as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `title`, which specifies the song's name as `TEXT`, given TEXT is appropriate for title fields.
* `time`, which specifies the duration of the song represented by `TIME`.
* `album_id`, which is the ID of the album as an "INTEGER". This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `Album` table to ensure data integrity.
* `artist_id`, which is the ID of the artist as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `Artist` table to ensure data integrity.
* `track_number`, which is the number of the song in each album representated by `INTEGER`.

#### Sales

The `Sales` table includes:

* `id`, which specifies the unique ID for the artist as an "INTEGER". This column thus has the `PRIMARY KEY` constraint applied.
* `album_id`, which is the ID of the album as an `INTEGER`. This column thus has the `FOREIGN KEY` constraint applied, referencing the `id` column in the `Albums` table to ensure data integrity.
* `sale_date`, which specifies when the sale was made. Timestamps in SQLite can be conveniently stored as `NUMERIC`, per SQLite documentation at <https://www.sqlite.org/datatype3.html>. The default value for the `sale_date` attribute is the current timestamp, as denoted by `DEFAULT` "CURRENT_TIMESTAMP"
* `quantity`, which is the quatity of a specific album a client bought as an `INTEGER`.
* `total_amount`, which is the total amount of money of the sold albums representated by `NUMERIC` Value.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ERD diagram](ERD_Final_Project.png)

As detailed by the diagram:

* an artist can have one or more albums and an album can be made by one or more artists.
* an album can contain one or several songs, but it cannot have any songs and each song must be contained in only 1 album.
* each album can be sold none or multiple times, but sales only include 1 album ID at a time.

## Optimizations

I created the following 3 indexes:


CREATE INDEX "idx_albums_artist_id" ON "albums" ("artist_id");
Reason: This index will improve queries that frequently filter or join on artist_id, such as retrieving all albums by a specific artist.

CREATE INDEX "idx_sales_album_id" ON "sales" ("album_id");
Reason: This index will optimize queries that calculate sales totals or filter sales by album, such as queries to determine the total revenue or sales of specific albums.

CREATE INDEX "idx_songs_album_id_track_number" ON "songs" ("album_id", "track_number");
Reason: This composite index will improve queries that retrieve songs from a specific album in order by track number, which is common when displaying album details with song listings.

## Limitations

- My desgin have some limitations, for example coulbe be a lack of historical sales data because the Sales table only represents aggregated sales data for each album. If you want to track more granular details, such as individual transactions or customer data, this design does not support it.
- also my Albums table has a format column, but it might not differentiate well between multiple formats for the same album (e.g., vinyl, CD, digital).
- I assumme that the price column in the Albums table is static. However, prices often vary over time (e.g., discounts, special events).
