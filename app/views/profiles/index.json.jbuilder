json.array!(@profiles) do |profile|
  json.extract! profile, :id, :bio, :profilable_type, :profilable_id
  json.url profile_url(profile, format: :json)
end
