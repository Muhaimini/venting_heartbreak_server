class CreateUserGuests < ActiveRecord::Migration[7.2]
  def change
    create_table :user_guests, id: :uuid do |t|
      t.string :device_id, null: false
      t.uuid :role_id, null: false

      t.timestamps
    end
  end
end
