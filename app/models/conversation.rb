class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => "sender_id", :class_name => 'Profile'
  belongs_to :receiver, :foreign_key => "receiver_id", :class_name => 'Profile'
  has_many :messages

  scope :between, -> (sender_id,receiver_id) do
    where("(sender_id = ? AND receiver_id  = ?) OR (sender_id = ? AND receiver_id  = ?)", sender_id,receiver_id, receiver_id, sender_id)
  end
end
