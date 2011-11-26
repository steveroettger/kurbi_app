class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :sex
      t.date :dateofbirth
      t.date :yeardiagnosed

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
