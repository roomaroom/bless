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

  has_many :friends_by_me, -> { where(status: 1) }, class_name: "Friend", foreign_key: "profile_id"
  has_many :friends_for_me, -> { where(status: 1) }, class_name: "Friend", foreign_key: "friend_id"
  has_many :friendships_by_me, through: :friends_by_me, source: :friend
  has_many :friendships_for_me, through: :friends_for_me, source: :profile

  has_many :pending_friends_by_me, -> { where(status: 0) }, class_name: "Friend", foreign_key: "profile_id"
  has_many :pending_friends_for_me, -> { where(status: 0) }, class_name: "Friend", foreign_key: "friend_id"
  has_many :pending_friendships_by_me, through: :pending_friends_by_me, source: :friend
  has_many :pending_friendships_for_me, through: :pending_friends_for_me, source: :profile

  accepts_nested_attributes_for :photos, allow_destroy: true

  def friends
    friends_by_me + friends_for_me
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def conversations
    sent_conversations + received_conversations
  end
end
