class AddImagesToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :images, :string
  end
end
