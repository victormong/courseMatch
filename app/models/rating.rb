class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	validates_presence_of :rate
	validates_presence_of :review
end
