
-- *** The Lost Letter ***

-- final destination package--
SELECT "address", "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "to_address_id" = (
            SELECT "to_address_id" FROM "packages" WHERE "from_address_id" = (
                SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
            )
        ) AND "contents" LIKE "%congratulatory%"
    ) AND "action" = 'Drop'
);

-- *** The Devious Delivery ***

--id packages based on content--
SELECT "id" FROM "packages" WHERE "contents" = (
    SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL
);

--address ID where package was drop--
SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "contents" = (
        SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL
    )
) AND "action" = 'Drop';

--final destiny adress--
SELECT "address", "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "contents" = (
            SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL
        )
    ) AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***

--from ID of the package--
SELECT "id" FROM "addresses"
WHERE "address" = '109 Tileston Street';

--to ID of the package--
SELECT "id" FROM "addresses"
WHERE "address" = '728 Maple Place';

--content package and package id--
SELECT "contents", "id" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
)
    AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
);

--driver id--
SELECT "driver_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    )
)
ORDER BY "timestamp" DESC
LIMIT 1;

--name of the driver who has thr package--

SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
            AND "to_address_id" = (
                SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
);
