json.array!(@airports) do |airport|
  json.extract! airport, :code, :cc_fips, :name, :lat, :long, :fixed_fare
  json.url airport_url(airport, format: :json)
end