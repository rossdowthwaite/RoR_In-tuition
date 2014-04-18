json.array!(@school_courses) do |school_course|
  json.extract! school_course, :id, :course_id, :school_id
  json.url school_course_url(school_course, format: :json)
end
