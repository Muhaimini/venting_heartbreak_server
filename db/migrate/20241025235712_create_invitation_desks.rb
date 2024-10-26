class CreateInvitationDesks < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_desks, id: :uuid do |t|
      t.integer :status, null: false, limit: 1, default: 0
      t.uuid :creator_id, null: false
      t.uuid :invitation_layout_id
      t.uuid :music_theme_id
      t.string :description

      t.timestamps
    end
  end
end
