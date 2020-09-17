class AddIndexToCattegoriesArticles < ActiveRecord::Migration[6.0]
  def change
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end
end
