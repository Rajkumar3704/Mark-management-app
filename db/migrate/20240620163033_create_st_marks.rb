class CreateStMarks < ActiveRecord::Migration[7.1]
  def change
    create_table :st_marks do |t|
      t.string :name
      t.string :roll_no
      t.string :course_title
      t.integer :course_id
      t.integer :credit
      t.integer :mark
      t.integer :s_id

      t.timestamps
    end
  end
end
