class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.uuid :subscription_id
      t.string :role_id, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :avatar
      t.string :initial_name
      t.string :label_color

      t.timestamps
    end
  end
end
