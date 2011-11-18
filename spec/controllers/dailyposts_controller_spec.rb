require 'spec_helper'

describe DailypostsController do
	render_views
	
	describe "access control" do
				
		it "should deny access to 'create'" do
			post :create
			response.should redirect_to(signin_path)
		end
		
		it "should deny access to 'delete'" do
			delete :destroy, :id => 1
			response.should redirect_to(signin_path)
		end
	end
	
	describe "POST 'create'" do
		before(:each) do
			@user = test_sign_in(Factory(:user))
		end
		
		describe "failure" do 
			before(:each) do	
				@attr = { :content => "" }
			end
			
			it "should not create a dailypost" do
				lambda do
				post :create, :dailypost => @attr
				end.should render_template(Dailypost, :count)
			end
			
			
		end
	end
end
