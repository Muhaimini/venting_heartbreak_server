class CreateStoryTimelines < ActiveRecord::Migration[7.2]
  def change
    create_table :story_timelines, id: :uuid do |t|
      t.uuid :selected_invitation_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
