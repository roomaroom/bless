class Activity < ActiveRecord::Base
  include TheComments::Commentable
  acts_as_likeable
  acts_as_mentioner

  belongs_to :item, polymorphic: true
  belongs_to :profile
  belongs_to :wall, :foreign_key => "wall_id", :class_name => "Profile"
  has_many :shared_profiles, :foreign_key => "shared_activity_id", :class_name => "Share"

  #enum item_type: [:share, :post, :comment]

  def count_likes
    self.likers(Profile).length
  end

  def count_shared
    self.shared_profiles.length
  end
end
