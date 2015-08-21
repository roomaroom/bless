class PostImage < ActiveRecord::Base
  belongs_to :photo
  belongs_to :post
  #accepts_nested_attributes_for :photo
end
