class Album < ActiveRecord::Base
  belongs_to :privacy
  belongs_to :profile
  has_many :photos, as: :imageable, dependent: :destroy
end
