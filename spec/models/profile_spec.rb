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

require 'spec_helper'

describe Profile do
  
  before(:each) do
  	@user = Factory(:user)
  	@attr = {
  		:location     =>     "example location", 
  		:bio          =>     "bio of the user", 
  		:birthday     =>     "00/00/0000", 
  		:diagnosed    =>     "0000", 
  		:medications  =>     "medications user is taking", 
  		:doctor       =>     "doctor",
  		:sex          =>     "male",
  		:race         =>     "caucasian"
   		}
  end
  
  it "should create a new instance given valid attributes" do
  	@user.create_profile
  end
  
  describe "user & profile associations" do
  	before(:each) do	
  		@profile = @user.create_profile
  	end
  	
  	it "should have a user attribute (id)" do
  		@profile.should respond_to(:user)
  	end
  	
  	it "should have the right associated user, to the correct profile" do
  		@profile.user_id.should == @user.id
  		@profile.user.should == @user
  	end
  end
end
