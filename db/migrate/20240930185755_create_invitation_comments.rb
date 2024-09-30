class CreateInvitationComments < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_comments, id: :uuid do |t|
      t.uuid :selected_invitation_id
      t.uuid :user_guest_id
      t.uuid :user_id
      t.string :text

      t.timestamps
    end
  end
end
