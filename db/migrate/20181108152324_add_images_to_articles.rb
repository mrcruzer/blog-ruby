class AddImagesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :images, :string
  end
end
