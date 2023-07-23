# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :text
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :posts
end
