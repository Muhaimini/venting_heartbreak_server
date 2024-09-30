class InvitationComment < ApplicationRecord
  belongs_to :selected_invitation # foreign_key: "selected_invitation_id"
  belongs_to :user_guest, foreign_key: "user_guest_id", optional: true
  belongs_to :user, foreign_key: "user_id", optional: true
end
