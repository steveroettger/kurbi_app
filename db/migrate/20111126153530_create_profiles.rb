class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :username
      t.date :birthday
      t.date :diagnosed

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
