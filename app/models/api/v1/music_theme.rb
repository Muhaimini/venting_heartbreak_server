class Api::V1::MusicTheme < ApplicationRecord
  scope :search_by_title_or_artist, ->(query) {
    where('title ILIKE ? OR artist ILIKE ?', "%#{query}%", "%#{query}%")
  }
  
  has_many :invitation_desks
  
  validates :src, presence: true
  validates :title, presence: true
  validates :artist, presence: true
end
