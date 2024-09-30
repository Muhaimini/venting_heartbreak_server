class Role < ApplicationRecord
  has_many :users
  has_many :user_guests
  validates :value, presence: true, uniqueness: true
end
