class Post < ActiveRecord::Base
  belongs_to :profile
  belongs_to :wall, :foreign_key => "wall_id", :class_name => "Profile"

  mount_uploader :avatar, ImageUploader

  after_create :create_activity

  def create_activity
    Activity.create(item: self, wall_id: wall_id, profile_id: profile_id)
  end
end