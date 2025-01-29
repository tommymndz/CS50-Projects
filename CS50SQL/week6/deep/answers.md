# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

adopt
-one of the benefits is that the replication is evenly distributed, which means that the databases will be distributed evenly and no single server will be overloaded with information.

Not adopt
- Random Partitioning is a bit slower, as you have to analyze all the ships to find an answer.
- it would be faster if you searched only the ships on which you want to focus your search.

## Partitioning by Hour
adopt
- using Partitioning by hour makes the search much easier if you want to search for a specific time range, as it can be done more quickly.
- Makes the search more efficient if i want to look for a specific range of hours.

not adopt
- if there is a lot of information (dates) for one of the ships, but no information for the other, we could overload one server with information and not use all the servers efficiently.

## Partitioning by Hash Value

adopt
- using a hash value can use the memory of the servers in a more efficient way without saturating any of the servers.
- knowing the hash value would allow me to focus my query on a single server by having a specific date making my search faster.

not adopt
- as the hash value is arbitrary it would be a bit slower to search for the precise information I am looking for, as I would have to check all servers if i dont have the exact date i want to look for.
- if I want to all.ocate memory in an equitable manner.
