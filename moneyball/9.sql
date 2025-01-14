SELECT "name", ROUND(AVG("salary"), 2) AS 'average salary' FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "name"
ORDER BY "average salary" ASC
LIMIT 5;
