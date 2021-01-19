class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :fullname, presence: true, length: { in: 3..20 }
  # rubocop:disable Style/MutableConstant
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rubocop:enable Style/MutableConstant
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end