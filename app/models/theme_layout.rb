class ThemeLayout < ApplicationRecord
  has_many :invitation_theme
  validates :name, presence: true
end
