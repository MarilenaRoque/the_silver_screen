class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index(:votes, :user_id)
    add_index(:votes, :article_id)
  end
end
