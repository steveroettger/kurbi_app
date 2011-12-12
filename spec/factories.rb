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

Factory.define :dailypost do |dailypost|
	dailypost.general 0..5	
	dailypost.stress 0..5
	dailypost.fatigue 0..5
	dailypost.general_note "general feeling"
	dailypost.association :user
end