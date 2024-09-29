class CreateRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :value, null: false

      t.timestamps
    end
  end
end
