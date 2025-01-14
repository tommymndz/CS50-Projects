SELECT "first_name", "last_name", "salary", "salaries"."year", "HR" FROM "salaries"
JOIN "players" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "players"."id" AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id", "salaries"."year" DESC, "HR" DESC, "salary" DESC;
