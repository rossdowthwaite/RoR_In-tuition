json.array!(@locations) do |location|
  json.extract! location, :id, :street, :city, :county, :country, :p_code, :addressable_id, :addressable_type
  json.url location_url(location, format: :json)
end
