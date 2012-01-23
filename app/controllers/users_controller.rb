class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :show, :edit, :update, :destroy]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user,   :only => [:destroy]

  def show
    @user = User.find(params[:id])
	@profile = @user.profile
    @title = @user.name
  end

  def new
  	@user = User.new
    @title = "Sign up"
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Kurbi! 
        				  Please click 'Edit Profile' to enter your profile information OR
        				  click 'Home' to submit your daily log now."
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
  end
  
  def edit
  	@user = User.find(params[:id])
  	@title = "Edit user"
  end
  
  def update
  	@user = User.find(params[:id])
  	 if @user.update_attributes(params[:user])
  	  flash[:success] = "Your account settings have been updated."
  	  redirect_to @user
  	 else
  	  @title = "Edit user"
  	  render 'edit'
  	 end  
  end
  
  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User account has been deleted."
  	redirect_to users_path
  end 
  
  def index
  	if current_user.admin?
  	@title = "All users"
  	@users = User.paginate(:page => params[:page])
  	else
  	redirect_to(current_user)
  	end
  end	
  
private 
    
  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
  	redirect_to(root_path) unless current_user.admin?
  end
end