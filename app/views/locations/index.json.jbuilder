json.array!(@locations) do |location|
  json.extract! location, :id, :address, :city, :lat, :long
  json.url location_url(location, format: :json)
end
