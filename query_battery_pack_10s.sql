select
    battery_pack_10s.*,
    batteries.cell_model,
    batteries.cell_brand,
    -- Capacity
    MAX(CASE WHEN measurements.measured_unit = 'mAh' THEN measurements.measured_time END) AS measured_capacity_time,
    MAX(CASE WHEN measurements.measured_unit = 'mAh' THEN measurements.measured_value END) AS measured_capacity_value,
    MAX(CASE WHEN measurements.measured_unit = 'mAh' THEN measurements.measured_unit END) AS measured_capacity_unit,
    -- Resistance
    MAX(CASE WHEN measurements.measured_unit = 'Ω' THEN measurements.measured_time END) AS measured_resistance_time,
    MAX(CASE WHEN measurements.measured_unit = 'Ω' THEN measurements.measured_value END) AS measured_resistance_value,
    MAX(CASE WHEN measurements.measured_unit = 'Ω' THEN measurements.measured_unit END) AS measured_resistance_unit
from battery_pack_10s
left join batteries on battery_pack_10s.serial_number = batteries.serial_number
left join measurements on battery_pack_10s.serial_number = measurements.serial_number
group by battery_pack_10s.serial_number 
order by pack_position; 