class ProfilePage < ActiveRecord::Base
  belongs_to :profile
  belongs_to :page
  #accepts_nested_attributes_for :photo
end
