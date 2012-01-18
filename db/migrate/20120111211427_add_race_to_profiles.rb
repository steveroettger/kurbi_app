class AddRaceToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :race, :string
  end
end
