class ThemeType < ApplicationRecord
  has_many :invitation_theme
  validates :value, presence: true, uniqueness: true
end
