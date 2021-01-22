class Following < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User

  scope :followings, ->(user) { where(user_id: user.id) }
end
