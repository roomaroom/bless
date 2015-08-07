class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :albums
  has_many :photos
  has_many :posts
  has_many :activities
  has_many :shared_activities, :foreign_key => "shared_profile_id", :through => :activity_shares

  mount_uploader :avatar, ImageUploader
  #friendship associations
  has_many :friends, :class_name => "Friend", :foreign_key => "profile_id", :dependent => :destroy
  has_many :accepted_friends, -> { where(status: 1) }, :class_name => "Friend"
  has_many :pending_friends,  -> { where(status: 0) }, :class_name => "Friend"
  #has_many :friends_initiated_by_me, :class_name => "Friendship", :foreign_key => "user_id", :conditions => ['initiator = ?', true], :dependent => :destroy
  #has_many :friendss_not_initiated_by_me, :class_name => "Friendship", :foreign_key => "user_id", :conditions => ['initiator = ?', false], :dependent => :destroy
  #has_many :occurances_as_friend, :class_name => "Friendship", :foreign_key => "friend_id", :dependent => :destroy



  accepts_nested_attributes_for :photos, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
