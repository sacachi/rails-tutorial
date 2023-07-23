json.list do
  json.array! @posts, partial: "posts/post", as: :post
end
json.total @total
