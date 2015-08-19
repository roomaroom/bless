class PostImage < ActiveRecord::Base
  belongs_to :photo
  belongs_to :post
end
