class CreateUserGuests < ActiveRecord::Migration[7.2]
  def change
    create_table :user_guests, id: :uuid do |t|
      t.string :device_id
      t.uuid :role_id

      t.timestamps
    end
  end
end
