json.array!(@forum_contributors) do |forum_contributor|
  json.extract! forum_contributor, :id, :contributor_id, :forum_id
  json.url forum_contributor_url(forum_contributor, format: :json)
end
