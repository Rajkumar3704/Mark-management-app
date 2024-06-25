class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :couse_title
      t.text :description
      t.string :course_code
      t.integer :credits

      t.timestamps
    end
  end
end
