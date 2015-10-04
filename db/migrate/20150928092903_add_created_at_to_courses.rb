class AddCreatedAtToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :created_at, :datetime
  end
end
