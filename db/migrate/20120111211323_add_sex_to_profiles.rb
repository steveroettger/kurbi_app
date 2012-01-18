class AddSexToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :sex, :string
  end
end
