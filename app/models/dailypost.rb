# == Schema Information
#
# Table name: dailyposts
#
#  id           :integer         not null, primary key
#  general      :integer
#  stress       :integer
#  fatigue      :integer
#  general_note :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#


class Dailypost < ActiveRecord::Base
	attr_accessible :general, :stress, :fatigue, :general_note
	
	belongs_to :user
	
	validates :general,  :presence => true
	validates :stress,   :presence => true
	validates :fatigue,  :presence => true
	validates :user_id,  :presence => true
	
	default_scope :order => 'dailyposts.created_at DESC'
end


