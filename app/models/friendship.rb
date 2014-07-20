class Friendship < ActiveRecord::Base
  belongs_to :profile
  belongs_to :friend, :class_name => "Profile", foreign_key: 'friend_id'
end
