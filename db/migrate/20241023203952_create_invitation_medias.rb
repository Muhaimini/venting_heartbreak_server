class CreateInvitationMedias < ActiveRecord::Migration[7.2]
  def change
    create_table :invitation_medias, id: :uuid do |t|
      t.string :type, null: false
      t.integer :size, null: false
      t.string :filename, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
