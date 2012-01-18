# == Schema Information
#
# Table name: profiles
#
#  id                 :integer         not null, primary key
#  location           :string(255) 
#  bio                :text
#  birthday           :date
#  diagnosed          :string(255)
#  medications        :text
#  doctor             :string(255)
#  sex                :string(255)
#  race               :string(255)
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#


class Profile < ActiveRecord::Base
	attr_accessible :location, :bio, :birthday, :diagnosed, :medications, :doctor, :sex, :race
	
	belongs_to :user
	
	
	
	
end
