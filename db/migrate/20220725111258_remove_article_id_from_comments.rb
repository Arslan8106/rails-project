class RemoveArticleIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :article_id, :string
  end
end
