class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :key
      t.string :name
      t.string :course_link
      t.string :level
      t.string :summary
      t.string :required_knowledge

      t.timestamps null: false
    end
  end
end
