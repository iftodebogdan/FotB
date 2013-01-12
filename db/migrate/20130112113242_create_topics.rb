class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic_name
      t.integer :band_id
      t.integer :album_id

      t.timestamps
    end
  end
end
