class DailypostsController < ApplicationController
	before_filter :authenticate	
	before_filter :authorized_user, :only => :destroy
	
	def create
	   @dailypost  = current_user.dailyposts.build(params[:dailypost])
	   if @dailypost.save
	     flash[:success] = "Thanks for updating Kurbi!"
	     redirect_to root_path
	   else
	     render 'pages/home'
	   end
	end
	
	def destroy
	    @dailypost.destroy
	    redirect_to root_path, :flash => { :success => "Your post has been deleted." }
	 end
	 	
	  private
	  
	    def authorized_user
	      @dailypost = current_user.dailyposts.find(params[:id])
	    rescue  
	      redirect_to root_path 
	    end

end



