class AddDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :descrption, :text
  end
end
