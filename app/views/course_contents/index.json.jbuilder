json.array!(@course_contents) do |course_content|
  json.extract! course_content, :id, :subject_id, :course_id
  json.url course_content_url(course_content, format: :json)
end
