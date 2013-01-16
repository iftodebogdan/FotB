class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.boolean :email
      t.string :website
      t.string :msn
      t.string :yahoo
      t.string :skype
      t.string :gtalk

      t.timestamps
    end
  end
end
