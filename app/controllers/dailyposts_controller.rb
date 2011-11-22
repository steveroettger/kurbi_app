class DailypostsController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]	
	
	def create
		@dailypost = current_user.dailyposts.build(params[:dailypost])
		if @dailypost.save
		  flash[:success] = "Thanks for updating Kurbi"
		  redirect_to root_path
		else 
		  render 'pages/home'
		end
	end
	
	def destroy
	
	end

end
