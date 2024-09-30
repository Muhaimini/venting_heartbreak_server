class CreateThemeTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :theme_types, id: :uuid do |t|
      t.string :value

      t.timestamps
    end
  end
end
