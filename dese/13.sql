SELECT "name", "proficient" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
WHERE "type" = 'Public School District' AND "proficient" < (
    SELECT AVG("proficient")
    FROM "staff_evaluations"
)
ORDER BY "proficient" ASC, "name" ASC
LIMIT 10;
