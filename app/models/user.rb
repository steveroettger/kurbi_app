# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_one :profile, :dependent => :destroy
  before_create :build_default_profile
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  # def should_generate_new_friendly_id?
  #	 new_record?
  # end
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,     :presence => true,
                       :length   => { :maximum => 50 }
  validates :email,    :presence => true,
                       :format   => { :with => email_regex },
                       :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
  					   :confirmation => true,
  					   :length => { :within => 6..40 }
  
before_save :encrypt_password
	
		def has_password?(submitted_password)
			encrypted_password == encrypt(submitted_password)
		end
	
	
		def self.authenticate(email, submitted_password)
		    user = find_by_email(email)
		    return nil  if user.nil?
		    return user if user.has_password?(submitted_password)
		end
		
		def self.authenticate_with_salt(id, cookie_salt)
		    user = find_by_id(id)
		    (user && user.salt == cookie_salt) ? user : nil
		end
			
	private
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
		
		def build_default_profile
		  # build default profile instance. Will use default params.
		  # The foreign key to the owning User model is set automatically
		  profile = build_profile
		  true # Always return true in callbacks as the normal 'continue' state
		       # Assumes that the default_profile can **always** be created.
		       # or
		       # Check the validation of the profile. If it is not valid, then
		       # return false from the callback. Best to use a before_validation 
		       # if doing this. View code should check the errors of the child.
		       # Or add the child's errors to the User model's error array of the :base
		       # error item
		end
		

end



