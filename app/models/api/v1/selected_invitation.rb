class Api::V1::SelectedInvitation < ApplicationRecord
  scope :selected_by, ->(selected_by) { where(selected_by: selected_by) }
  
  belongs_to :invitation_theme, foreign_key: "invitation_theme_id"
  has_many :story_timelines, foreign_key: "selected_invitation_id"
  has_many :invitation_special_guests, foreign_key: "selected_invitation_id"
  # has_many :invitation_comments, foreign_key: "selected_invitation_id"

  # override as_json
  def as_json(options = {})
    super(options.merge(
      include: {
        invitation_theme: {
          except: [ :creator_id, :type_theme_id ],
          include: {
            theme_type: { only: [ :id, :value ] },
            creator: {
              only: [ :id, :username, :avatar, :initial_name, :label_color ]
            }
          }
        },
        story_timelines: {
          only: [ :id, :title, :description ]
        },
        invitation_special_guests: {
          only: [ :id, :name, :description ]
        }
        # invitation_comments: {}
      },
      except: [ :invitation_theme_id ]
    ))
  end
end
