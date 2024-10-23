class CreateInvitationPages < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_pages, id: :uuid do |t|
      t.uuid :invitation_asset_id, null: false
      t.uuid :invitation_media_id, null: false
      t.integer :index, null: false, default: 1
      t.string :subtitle
      t.string :content

      t.timestamps
    end
  end
end
