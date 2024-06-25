class AddUserIdToStudentDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :student_details, :user_id, :integer
    add_index :student_details, :user_id
  end
end
