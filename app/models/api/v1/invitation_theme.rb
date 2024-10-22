class Api::V1::InvitationTheme < ApplicationRecord
  # belongs_to :user, foreign_key: "creator_id", optional: true
  belongs_to :creator, class_name: "User", foreign_key: "creator_id", optional: true
  belongs_to :theme_type, foreign_key: "type_theme_id", optional: true
  belongs_to :theme_layout, foreign_key: "theme_layout_id", optional: true

  # Override as_json
  def as_json(options = {})
    super(options.merge(
      include: {
        theme_type: { only: [ :id, :title ] },
        theme_layout: { only: [ :id, :name ] },
        creator: {
          only: [ :username, :avatar, :initial_name, :label_color ]
        }
      },
      except: [ :creator_id, :type_theme_id, :theme_layout_id ]
    ))
  end
end
