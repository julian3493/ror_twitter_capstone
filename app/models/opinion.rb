class Opinion < ApplicationRecord
  validates :content, presence: true, length: { maximum: 500, too_long: '500 characters is the maximum allowed.' }

  belongs_to :user
end
