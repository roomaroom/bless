class Post < ActiveRecord::Base
  belongs_to :profile
  mount_uploader :avatar, ImageUploader
end
