class Share < ActiveRecord::Base
  belongs_to :shared_profile, :class_name => "Profile"
  belongs_to :shared_activity, :class_name => "Activity"
end
