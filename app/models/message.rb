class Message < ActiveRecord::Base
  belongs_to :profile
  belongs_to :conversation
end
