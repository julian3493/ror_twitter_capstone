class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :fullname, presence: true, length: { in: 3..20 }
  validates :email, presence: true

  has_many :opinions, dependent: :destroy
  has_many :followings, dependent: :destroy

  has_many :followeds, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: 'user_id', dependent: :destroy

  has_many :users, through: :followeds

  scope :not_followed, ->(query) { where.not(id: query.pluck(:user_id)) }
  scope :user_followers, ->(user) { where(id: user.followers.pluck(:follower_id)) }
  scope :all_except, ->(user) { where.not(id: user) }
end
