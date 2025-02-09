# Database for reused lion batteries

Contains a list of uniqely identified batteries, measurements performed on them and some extra stuff, like how my battery_pack is composed of these batteries so I can look back on cell measurements.

# Battery pack 10S

I built a battery pack. When I did so, I needed to sort batteries by their capacity and internal resistance. This allows me to match the best batteries I have to build the pack. Hopefully this increases it's lifetime and performance.

The pack uses [Sony lion cells](https://secondlifestorage.com/index.php?pages/cell-database/&fsort=1&fbrand=&fform=&fkeys=US18650V3) sourced from used cordless vacuum cleaners.

Query the battery pack with `query_battery_pack_10s.sql`

```sh
sqlite3 battery_data.db ".mode box" ".read query_battery_pack_10s.sql"
```

Or with nushell:

```sh
sqlite3 battery_data.db ".mode json" ".read query_battery_pack_10s.sql" | from json
```

Even better:

```sh
open battery_data.db | query db (open query_battery_pack_10s.sql)
```