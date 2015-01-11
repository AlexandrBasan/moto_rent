json.array!(@destination_fares) do |destination_fare|
  json.extract! destination_fare, :vehicletype_id, :destination_id, :dest_fare
  json.url destination_fare_url(destination_fare, format: :json)
end