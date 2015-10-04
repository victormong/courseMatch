class RemoveCreatedAtFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :created_at, :datetime
  end
end
