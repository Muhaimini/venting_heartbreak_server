class CreateThemeTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :theme_types, id: :uuid do |t|
      t.string :title, null: false
      t.string :description
      t.string :img_cover

      t.timestamps
    end
  end
end
