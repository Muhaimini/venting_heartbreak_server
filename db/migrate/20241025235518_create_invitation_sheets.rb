class CreateInvitationSheets < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_sheets, id: :uuid do |t|
      t.uuid :invitation_desk_id, null: false
      t.uuid :creator_id, null: false
      t.string :content

      t.timestamps
    end
    add_foreign_key :invitation_sheets, :invitation_desks, column: :invitation_desk_id
  end
end
