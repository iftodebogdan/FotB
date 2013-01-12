class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_content
      t.integer :user_id
      t.integer :band_id
      t.integer :album_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
