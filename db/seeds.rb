# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Course.destroy_all

CSV.foreach('dataset.csv', headers: true) do |course|
	c = Course.new(course.to_hash.except(nil))
  c.save!
end
