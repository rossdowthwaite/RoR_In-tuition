json.array!(@materials) do |material|
  json.extract! material, :id, :topic_id, :medium_id, :medium_type
  json.url material_url(material, format: :json)
end
