class Page < ActiveRecord::Base
  has_many :profile_pages
  has_many :profiles, through: :profile_pages
end
