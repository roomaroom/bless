class Activity < ActiveRecord::Base
  belongs_to :item, polymorphic: true
  belongs_to :profile
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "Profile"
  has_many :shared_profiles, :foreign_key => "shared_activity_id", :through => :activity_shares
end
