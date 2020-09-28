class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index(:bookmarks, :user_id)
    add_index(:bookmarks, :article_id)
  end
end
