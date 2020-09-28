class AddCreatorIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :articles, :author_id
  end
end
