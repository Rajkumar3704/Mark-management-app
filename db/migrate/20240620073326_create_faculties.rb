class CreateFaculties < ActiveRecord::Migration[7.1]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.integer :Faculty_id
      t.string :gender
      t.date :dob
      t.text :address
      t.string :email
      t.integer :phone
      t.string :department

      t.timestamps
    end
  end
end
