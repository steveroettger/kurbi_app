# == Schema Information
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  username   :string(255)
#  birthday   :date
#  diagnosed  :date
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ActiveRecord::Base

	belongs_to :user
end



