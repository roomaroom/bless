class ProfileGroup < ActiveRecord::Base
  belongs_to :profile
  belongs_to :group
  #accepts_nested_attributes_for :photo
end
