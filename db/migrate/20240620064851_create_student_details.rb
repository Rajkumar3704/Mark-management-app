class CreateStudentDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :student_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :roll_no
      t.string :gender
      t.date :dob
      t.text :address
      t.string :email
      t.string :phone
      t.string :blood_group
      t.string :dept
      t.string :parent_name
      t.string :parent_phone_no

      t.timestamps
    end
  end
end
