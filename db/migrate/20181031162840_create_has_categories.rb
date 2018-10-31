class CreateHasCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :has_categories do |t|
      t.references :articles, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
