
SELECT "first_name", "last_name" FROM (
SELECT "first_name", "last_name", "id" FROM (SELECT "first_name", "last_name", "players"."id" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "players"."id" AND "salaries"."year" = "performances"."year"
WHERE "performances"."year" = 2001 AND "H" != 0
ORDER BY "salary"/"H"
LIMIT 10)

INTERSECT

SELECT "first_name", "last_name", "id" FROM (SELECT "first_name", "last_name", "players"."id" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "players"."id" AND "salaries"."year" = "performances"."year"
WHERE "performances"."year" = 2001 AND "RBI" != 0
ORDER BY "salary"/"RBI"
LIMIT 10))
ORDER BY "id" ASC, "last_name"
