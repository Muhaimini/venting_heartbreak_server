class CreateStoryTimelines < ActiveRecord::Migration[7.2]
  def change
    create_table :story_timelines, id: :uuid do |t|
      t.uuid :selected_invitation_id, null: false
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
