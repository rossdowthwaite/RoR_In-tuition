json.array!(@subject_topics) do |subject_topic|
  json.extract! subject_topic, :id, :subject_id, :topic_id
  json.url subject_topic_url(subject_topic, format: :json)
end
