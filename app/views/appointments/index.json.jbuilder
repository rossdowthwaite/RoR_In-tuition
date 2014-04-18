json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :booking_id, :owner, :confirmed
  json.url appointment_url(appointment, format: :json)
end
