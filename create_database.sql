create table batteries (
    serial_number text primary key,
    model text,
    brand text
);

create table measurements (
    id integer primary key autoincrement,
    serial_number text not null,
    measurement_time datetime default current_timestamp,
    measured_variable text not null,
    measured_value real not null,
    foreign key (serial_number) references batteries (serial_number)
);

create table battery_pack_10s (
    serial_number text primary key,
    pack_position integer not null,
    foreign key (serial_number) references batteries (serial_number)
)