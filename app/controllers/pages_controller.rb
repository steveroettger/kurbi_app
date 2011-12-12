class PagesController < ApplicationController
  def home
  	@title = "Home"
  	@dailypost = Dailypost.new if signed_in?
  end

  def contact
  	@title = "Contact"
  end
  
  def about
  	@title = "About"
  end
 
end
