class Subscription < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :expired_at, presence: true
end
