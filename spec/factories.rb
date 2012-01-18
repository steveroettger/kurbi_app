# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Steve Roettger"
  user.email                 "steve.roettger@gmail.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :profile do |profile|
	profile.location "example location"	
	profile.bio "bio of the user"
	profile.birthday "00/00/0000"
	profile.diagnosed "0000"
	profile.medications "medications user is taking"
	profile.doctor "doctor"
	profile.sex "male"
	profile.race "caucasian"
	profile.association :user
end


