class Api::V1::ThemeLayout < ApplicationRecord
  has_many :invitation_theme
  validates :name, presence: true
end
