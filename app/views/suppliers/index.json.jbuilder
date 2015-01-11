json.array!(@suppliers) do |supplier|
  json.extract! supplier, :user_id, :address, :name
  json.url supplier_url(supplier, format: :json)
end