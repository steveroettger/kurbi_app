class Dailypost < ActiveRecord::Base
	attr_accessible :general, :stress, :fatigue, :general_note
	
	belongs_to :user
	
	validates :general, :stress, :fatigue, :presence => true
	validates :user_id, :presence => true
	
	default_scope :order => 'dailyposts.created_at DESC'
end
