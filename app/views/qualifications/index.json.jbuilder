json.array!(@qualifications) do |qualification|
  json.extract! qualification, :id, :user_id, :quality
  json.url qualification_url(qualification, format: :json)
end
