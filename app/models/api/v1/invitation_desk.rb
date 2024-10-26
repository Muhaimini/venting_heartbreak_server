class Api::V1::InvitationDesk < ApplicationRecord
  scope :created_by, ->(created_by) { where(creator_id: created_by) }

  has_many :invitation_sheets, foreign_key: "invitation_desk_id"
  belongs_to :creator, class_name: "User", foreign_key: "creator_id", optional: true
  belongs_to :music_theme, optional: true

  enum :status, { "draft": 0, "published": 1 }

  after_create :create_invitation_sheet

  def as_json(options = {})
    super(options.merge(
      include: {
        creator: { only: [ :id, :username, :avatar, :initial_name, :label_color ] },
        music_theme: { only: [ :id, :src, :title, :artist ] }
      },
      except: [:creator_id]
    ))
  end

  private

  def create_invitation_sheet
    invitation_sheets.create(content: "Here we go!", creator_id: self.creator_id)
  end
end
