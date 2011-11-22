require 'spec_helper'

describe Dailypost do
 before(:each) do
 	@user = Factory(:user) 
 	@attr = {
 			  :general => 0..5,
 			  :stress => 0..5,
 			  :fatigue => 0..5,
 			  :general_note => "general comments"
			}
 end
 
 it "should create a new instance given valid attributes" do
 	@user.dailyposts.create!(@attr)
 end
 
 describe "user associations" do
 	before(:each) do
 		@dailypost = @user.dailyposts.create(@attr)
 	end
 	
 	it "should have a user attribute" do
 		@dailypost.should respond_to(:user)
 	end
 	
 	it "should have the right associated user" do
 		@dailypost.user_id.should == @user.id
 		@dailypost.user.should == @user
 	end
 end
 
 describe "validations" do
 	it "should require a user id" do
 		Dailypost.new(@attr).should_not be_valid
 	end
 	
 	it "should require a nonblank dailypost" do
 		@user.dailyposts.build(:general => " ",
 							   :stress => " ",
 							   :fatigue => " ").should_not be_valid
 						
 	end
 end
end

# == Schema Information
#
# Table name: dailyposts
#
#  id           :integer         not null, primary key
#  general      :integer
#  stress       :integer
#  fatigue      :integer
#  general_note :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

