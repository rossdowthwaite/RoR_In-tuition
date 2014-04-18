json.array!(@bookings) do |booking|
  json.extract! booking, :id, :title, :description, :start, :end, :start_time, :end_time
  json.url booking_url(booking, format: :json)
end
