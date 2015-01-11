json.array!(@vehicletypes) do |vehicletype|
  json.extract! vehicletype, :vtype, :vdescription, :image, :passnum, :bagagenum
  json.url vehicletype_url(vehicletype, format: :json)
end