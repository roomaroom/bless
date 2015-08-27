class Profile < ActiveRecord::Base
  #acts_as_follower
  acts_as_liker
  #acts_as_messageable

  belongs_to :user
  has_many :albums
  has_many :photos, as: :imageable, dependent: :destroy
  has_many :posts
  has_many :activities
  has_many :wall_activities, :foreign_key => "wall_id", :class_name => "Activity"
  has_many :shared_activities, :foreign_key => "shared_profile_id", :through => :activities
  has_many :profile_songs
  has_many :songs, through: :profile_songs
  has_many :profile_pages
  has_many :pages, through: :profile_pages
  has_many :profile_groups
  has_many :groups, through: :profile_groups

  mount_uploader :avatar, ImageUploader

  # Messages
  has_many :sent_conversations,     :class_name => 'Conversation', :foreign_key => 'sender_id'
  has_many :received_conversations, :class_name => 'Conversation', :foreign_key => 'receiver_id'

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

  def conversations
    sent_conversations + received_conversations
  end
end
