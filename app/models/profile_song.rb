class ProfileSong < ActiveRecord::Base
  belongs_to :profile
  belongs_to :song
  #accepts_nested_attributes_for :photo
end
