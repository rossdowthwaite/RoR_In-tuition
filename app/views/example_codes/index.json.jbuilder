json.array!(@example_codes) do |example_code|
  json.extract! example_code, :id, :example_string, :example_int, :user_id
  json.url example_code_url(example_code, format: :json)
end
