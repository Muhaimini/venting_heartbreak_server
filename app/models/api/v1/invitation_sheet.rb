class Api::V1::InvitationSheet < ApplicationRecord
  scope :invitation_desk_id, ->(invitation_desk_id) { where(invitation_desk_id: invitation_desk_id) }

  belongs_to :invitation_desk
end
