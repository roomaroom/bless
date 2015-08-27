class Group < ActiveRecord::Base
  has_many :profile_groups
  has_many :profiles, through: :profile_groups
end
