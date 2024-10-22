class Api::V1::InvitationComment < ApplicationRecord
  belongs_to :selected_invitation
  belongs_to :user_guest, foreign_key: "user_guest_id", optional: true
  belongs_to :user, foreign_key: "user_id", optional: true

  def as_json(options = {})
    super(options.merge(
      include: {
        user: { only: [ :id, :username, :avatar, :initial_name, :label_color ] },
        user_guest: { only: [ :id, :device_id ] }
      },
      except: [ :selected_invitation_id, :user_guest_id, :user_id ]
    ))
  end
end
