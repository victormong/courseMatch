class Course < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]
  	searchkick
	require 'csv'
	
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			row = row.to_hash.reject{|k,v|k.nil?}
			Course.create! row
		end
	end
	belongs_to :user
	has_many :ratings
end
