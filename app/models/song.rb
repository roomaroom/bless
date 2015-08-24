class Song < ActiveRecord::Base
  has_many :profile_songs
  has_many :profiles, through: :profile_songs

  mount_uploader :audio, AudioUploader
end
