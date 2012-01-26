module ApplicationHelper

	# Return a title on a per-page basis.
	def title
		base_title = "Kurbi"
		if @title.nil?
		base_title
		else
		 "#{base_title} | #{@title}"
		end
	end	 
	
	def logo
		image_tag("kurbi-logo.png", :alt => "Kurbi Mobile Health")
	end
	
	def home_image
		image_tag("main-image.png")
	end
	
	def kurbi_pic
		image_tag("kurbi-pic.png", :alt => "Kurbi Mobile Health")
	end
	
	def wes_pic
		image_tag("wes-pic.gif", :alt => "Wes Garnett Jr. Kurbi")
	end
	
	def steve_pic
		image_tag("Steve-Pic.gif", :alt => "Steve Roettger Kurbi")
	end
	
	def david_pic
		image_tag("dave-pic.gif", :alt => "David Clizbe Kurbi")
	end
	
	def twitter
		image_tag("twitter.gif", :alt => "Go Kurbi Twitter")
	end
	
	def tumblr
		image_tag("tumblr.gif", :alt => "Kurbi Mobile Health Tumblr Blog")
	end
	
	def facebook 
		image_tag("facebook.gif", :alt => "Kurbi Mobile Health Facebook Profile")
	end
end
