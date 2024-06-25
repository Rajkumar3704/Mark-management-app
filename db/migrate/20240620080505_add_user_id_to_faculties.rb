class AddUserIdToFaculties < ActiveRecord::Migration[7.1]
  def change
    add_column :faculties, :user_id, :integer
    add_index :faculties, :user_id
  end
end
