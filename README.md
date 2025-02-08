# Storage for data about reused lion batteries

The goal is to keep a database with all usefull data I can query. It should contain a list of uniqely identified batteries, measurements performed on them and some extra stuff, like how my battery_pack is composed of these batteries so I can backtrack to their measurements.

# Battery pack 10S

I built a battery pack and want needed to sort batteries by their capacity and internal resistance. This allows me to match the best batteries I have to build the pack. Hopefully this increases its lifetime and performance.

The pack uses [Sony lion cells](https://secondlifestorage.com/index.php?pages/cell-database/&fsort=1&fbrand=&fform=&fkeys=US18650V3) sourced from used cordless vacuum cleaners.

## SQL scripts

I try to keep all the used sql statements persisted in scripts. These were mainly used in transfering all the battery related data from a csv file. `US18650V3.csv` -> `database`. You can test that with:
```bash
sqlite3 :memory: ".read csv_transfer_example.sql"
```
