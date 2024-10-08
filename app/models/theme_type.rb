class ThemeType < ApplicationRecord
  has_many :invitation_theme
  validates :title, presence: true, uniqueness: true
end
