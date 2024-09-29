class Role < ApplicationRecord
  has_many :users
  validates :value, presence: true, uniqueness: true
end
