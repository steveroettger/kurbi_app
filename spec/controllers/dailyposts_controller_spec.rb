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
				@attr = { :general => "", 
						  :stress => "",
						  :fatigue => "",
						  :general_note => ""
						}
			end
			
			it "should not create a dailypost" do
				lambda do
				post :create, :dailypost => @attr
				end.should render_template(Dailypost, :count)
			end
			
			it "should render the home page" do
				post :create, :dailypost => @attr
				response.should render_template('pages/home')
			end
		end
		
		describe "success" do
			before(:each) do 
				@attr = { :general => 0..5, 
						  :stress => 0..5,
						  :fatigue => 0..5,
						  :general_note => "general comments"
						}
			end
			
			it "should create a dailypost" do
				lambda do
					post :create, :dailypost => @attr
				end.should change(Dailypost, :count).by(1)	
			end
			
			it "should redirect to the home page" do
				post :create, :dailypost => @attr
				response.should redirect_to(root_path)
			end
			
			it "should have a flash message" do
			       post :create, :dailypost => @attr
			       flash[:success].should =~ /thanks for updating Kurbi/i
			end	 
		end
	end
	
	describe "DELETE 'destroy'" do
		describe "for an unauthorized user" do
			before(:each) do
				@user = Factory(:user)
				wrong_user = Factory(:user, :email => Factory.next(:email))
		        test_sign_in(wrong_user)
		        @dailypost = Factory(:dailypost, :user => @user)
			end
			
			it "should deny access" do
				delete :destroy, :id => @dailypost
				response.should redirect_to(root_path)
			end
		end
		
		describe "for an authorized user" do
			before(:each) do
				@user = test_sign_in(Factory(:user))
				@dailypost = Factory(:dailypost, :user => @user)
			end
			
			it "should delete the dailypost" do
				lambda do
					delete :destroy, :id => @dailypost
				end.should change(Dailypost, :count).by(-1)
			end
		end
	end
end
