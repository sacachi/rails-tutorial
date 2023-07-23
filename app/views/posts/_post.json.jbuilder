json.extract! post, :id, :title, :desc, :created_at, :updated_at
json.author do
  json.id post.author&.id
  json.name post.author&.name
end
json.url post_url(post, format: :json)
