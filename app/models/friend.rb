class Friend < ActiveRecord::Base
  enum status: [ :pending, :accept, :reject ]
  belongs_to :profile
  belongs_to :friend, class_name: 'Profile', foreign_key: 'friend_id'

  after_create :send_request
  def send_request
    #Notifier.friend_request(from, person).deliver
  end

  def update_accept
    self.update_attribute(:status, 'accept')
  end

  def update_reject
    self.update_attribute(:status, 'reject')
  end
end
