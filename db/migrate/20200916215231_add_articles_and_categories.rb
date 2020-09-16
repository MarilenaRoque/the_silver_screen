class AddArticlesAndCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :articles, :categories
  end
end
