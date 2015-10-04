class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :courses, :created_at
  	remove_column :courses, :updated_at
  	  end
end
