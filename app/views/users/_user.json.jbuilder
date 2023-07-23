if @user.blank?
  json.status false
  json.message 'Khong co doi tuong'
else
  json.extract! @user || User.new, :name, :id, :email
  json.avatar @user.avatar&.url
  json.posts @user&.posts do |post|
    json.call post, :id, :desc
  end
end


