class CreateInvitationAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_assets, id: :uuid do |t|
      t.uuid :selected_invitation_id, null: false
      t.string :cover_title
      t.string :cover_img
      t.string :color_bg

      t.timestamps
    end
  end
end
