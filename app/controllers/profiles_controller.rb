class ProfilesController < ApplicationController
 before_filter :authenticate
 
  # GET /profiles
  # GET /profiles.json
  def index
    redirect_to root_path  
   end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
	@user = User.find(params[:id])
	
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @user, notice: 'Your profile has been successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
