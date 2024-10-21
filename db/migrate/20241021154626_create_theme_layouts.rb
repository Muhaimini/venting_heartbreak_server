class CreateThemeLayouts < ActiveRecord::Migration[7.2]
  def change
    create_table :theme_layouts, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
