class CreateDailyposts < ActiveRecord::Migration
  def self.up
    create_table :dailyposts do |t|
      t.integer :general
      t.integer :stress
      t.integer :fatigue
      t.text :general_note
      t.integer :user_id

      t.timestamps
    end
    add_index :dailyposts, [:user_id, :created_at]
  end

  def self.down
    drop_table :dailyposts
  end
end
