let database = 'battery-data.db.temp'

sqlite3 $database ".read create_database.sql"

let csv = open US18650V3.csv

for row in $csv {
    let query = $"insert into batteries \(serial_number, cell_model, cell_brand\) values \(\'($row.sn)\', 'US18650V3', 'Sony'\);"
    sqlite3 $database $query

    if ($row.mAh-2023-06-04 | is-not-empty) {
        let query = $"insert into measurements \(serial_number, measured_time, measured_unit, measured_value\) values \(\'($row.sn)\', '2023-06-04 12:00:00', 'mAh', ($row.mAh-2023-06-04)\);"
        sqlite3 $database $query
    }
    
    if ($row.r_2024-06-03 | is-not-empty) {
        let query = $"insert into measurements \(serial_number, measured_time, measured_unit, measured_value\) values \(\'($row.sn)\', '2024-06-03 12:00:00', 'Ω', ($row.r_2024-06-03)\);"
        sqlite3 $database $query
    }

    if ($row.pos | is-not-empty) {
        let query = $"insert into battery_pack_10s \(serial_number, pack_position\) values \(\'($row.sn)\', ($row.pos)\);"
        sqlite3 $database $query
    }
}

print (sqlite3 $database ".mode box" "select * from batteries;")
print (sqlite3 $database ".mode box" "select * from measurements;")
print (sqlite3 $database ".mode box" "select * from battery_pack_10s;")