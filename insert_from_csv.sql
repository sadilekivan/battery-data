-- Parameters are ($serial_number: text, $capacity: real, $resistance: real, $pack_position: integer)

insert into batteries (serial_number, model, brand) values ($serial_number, 'US18650V3', 'Sony');

insert into measurements (serial_number, measurement_time, measured_variable, measured_value) values ($serial_number, '2023-06-04', 'mAh', $capacity);
insert into measurements (serial_number, measurement_time, measured_variable, measured_value) values ($serial_number, '2024-06-03', 'R', $resistance);

insert into battery_pack_10s (serial_number, pack_position) values ($serial_number, $pack_position);