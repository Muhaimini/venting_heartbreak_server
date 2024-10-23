class CreateTimelineSetions < ActiveRecord::Migration[7.2]
  def change
    create_table :timeline_setions, id: :uuid do |t|
      t.uuid :story_timeline_id, null: false
      t.uuid :invitation_media_id, null: false
      t.string :subtitle
      t.uuid :description

      t.timestamps
    end
  end
end
