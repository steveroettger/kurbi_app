class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :location
      t.text :bio
      t.date :birthday
      t.string :diagnosed
      t.text :medications

      t.timestamps
    end
  end
end
