class CreateInvitationThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_themes, id: :uuid do |t|
      t.uuid :creator_id, null: false
      t.uuid :type_theme_id, null: false
      t.uuid :theme_layout_id, null: false
      t.string :label, null: false
      t.string :description
      t.string :img_cover
      t.string :song_src
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
