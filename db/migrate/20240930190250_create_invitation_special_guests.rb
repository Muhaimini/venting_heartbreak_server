class CreateInvitationSpecialGuests < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_special_guests, id: :uuid do |t|
      t.uuid :selected_invitation_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
