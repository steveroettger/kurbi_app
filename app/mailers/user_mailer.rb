class UserMailer < ActionMailer::Base
  default :from => "steve.roettger@gmail.com"
  
  def registration_confirmation(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", 
  	     :subject => "Thanks for registering, and welcome to Kurbi #{user.name}!")
  end
end
