# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  desc       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
end
