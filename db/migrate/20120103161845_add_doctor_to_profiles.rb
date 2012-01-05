class AddDoctorToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :doctor, :string
  end
end
