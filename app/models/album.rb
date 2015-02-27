class Album < ActiveRecord::Base
  belongs_to :privacy
  belongs_to :profile
  has_many :photos, dependent: :destroy
end
