-- Parameters are ($serial_number: text, $capacity: real, $resistance: real, $pack_position: integer)

insert into batteries (serial_number, cell_model, cell_brand) values ($serial_number, 'US18650V3', 'Sony');

insert into measurements (serial_number, measured_time, measured_unit, measured_value) values ($serial_number, '2023-06-04 12:00:00', 'mAh', $capacity);
insert into measurements (serial_number, measured_time, measured_unit, measured_value) values ($serial_number, '2024-06-03 12:00:00', 'Ω', $resistance);

insert into battery_pack_10s (serial_number, pack_position) values ($serial_number, $pack_position);