class AddUpdatedAtToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :updated_at, :datetime
  end
end
