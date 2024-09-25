class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins, id: :uuid do |t|
      t.string :name
      t.string :password_digest
      t.string :img

      t.timestamps
    end
  end
end
