class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, :dependent => :destroy

  after_create :build_profile

  def build_profile
    profile = Profile.new(user: self) # Associations must be defined correctly for this syntax, avoids using ID's directly.
  	profile.save(validate: false)
  end
end
