class CreateMusicThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :music_themes, id: :uuid do |t|
      t.string :src, null: false
      t.string :title, null: false
      t.string :artist, null: false

      t.timestamps
    end
  end
end
