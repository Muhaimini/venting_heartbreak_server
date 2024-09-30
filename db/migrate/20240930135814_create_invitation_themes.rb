class CreateInvitationThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_themes, id: :uuid do |t|
      t.uuid :creator_id
      t.uuid :type_theme_id
      t.string :label
      t.string :description
      t.string :img_cover
      t.string :song_src
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
