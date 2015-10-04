class RemoveUpdatedAtFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :updated_at, :datetime
  end
end
