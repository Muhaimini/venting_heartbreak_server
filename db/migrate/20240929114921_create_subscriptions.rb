class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.uuid :user_id
      t.date :expired_at
      t.timestamps
    end

    add_foreign_key :subscriptions, :users, column: :user_id
  end
end
