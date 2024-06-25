class RenameOldColumnToNewColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :Courses, :couse_title, :course_title
  end
end
