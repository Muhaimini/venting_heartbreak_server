class InvitationTheme < ApplicationRecord
  belongs_to :user, foreign_key: "creator_id", optional: true
  belongs_to :theme_type, foreign_key: "type_theme_id", optional: true

  # Override as_json
  def as_json(options = {})
    super(options.merge(
      include: {
        theme_type: { only: [ :id, :value ] } # or replaced with theme_type
      }
    )).merge(
      creator: {
        id: user.id,
        username: user.username,
        avatar: user.avatar,
        initial_name: user.initial_name,
        label_color: user.label_color
      }
    )
  end
end
