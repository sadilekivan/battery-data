-- run in terminal `sqlite3 :memory: ".read test.sql"`

.read create_database.sql

.param set $serial_number 'the_godsent_lion'
.param set $capacity 4500
.param set $resistance 0.01
.param set $pack_position 13

.read insert_from_csv.sql

.mode box

select * from batteries;
select * from measurements;
select * from battery_pack_10s;