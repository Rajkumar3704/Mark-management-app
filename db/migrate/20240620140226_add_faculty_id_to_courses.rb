class AddFacultyIdToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :faculty_id, :integer
  end
end
