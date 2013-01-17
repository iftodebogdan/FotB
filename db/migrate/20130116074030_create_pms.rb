class CreatePms < ActiveRecord::Migration
  def change
    create_table :pms do |t|
      t.integer :user_id
      t.integer :sender_id
      t.string :message
      t.boolean :read

      t.timestamps
    end
  end
end
