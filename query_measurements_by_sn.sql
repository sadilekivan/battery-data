.mode box

select
    batteries.*,
    pack.pack_position
from batteries
left join battery_pack_10s as pack on batteries.serial_number = pack.serial_number;

select * from measurements where measurements.serial_number = $serial_number order by measurement_time desc;