class CreateSelectedInvitations < ActiveRecord::Migration[7.2]
  def change
    create_table :selected_invitations, id: :uuid do |t|
      t.uuid :invitation_theme_id, null: false
      t.uuid :selected_by, null: false
      t.date :published_at
      t.date :closed_at

      t.timestamps
    end
  end
end
