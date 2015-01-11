json.array!(@destinations) do |destination|
  json.extract! destination, :airport_id, :name, :address, :address_description, :avg_duration_min, :distance, :lat, :long
  json.url destination_url(destination, format: :json)
end