require 'csv'
puts "in"
CSV.foreach('dataset.csv', headers: true) do |course|
	puts course.inspect
end
