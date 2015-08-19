class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  #belongs_to :album
  #belongs_to :profile
  has_many :post_images
  has_many :posts, through: :post_images

  mount_uploader :image, ImageUploader
end
