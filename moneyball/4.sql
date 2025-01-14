SELECT "first_name", "last_name", "salary" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
WHERE "year" = 2001
ORDER BY "salary" ASC, "first_name", "last_name", "player_id"
LIMIT 50;
