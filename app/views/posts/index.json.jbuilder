json.array!(@posts) do |post|
  json.extract! post, :id, :profile_id, :upload, :status
  json.url post_url(post, format: :json)
end
