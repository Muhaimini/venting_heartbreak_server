class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins, id: :uuid do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :img

      t.timestamps
    end
  end
end
