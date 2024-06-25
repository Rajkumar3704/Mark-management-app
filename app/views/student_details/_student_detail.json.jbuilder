json.extract! student_detail, :id, :first_name, :last_name, :roll_no, :gender, :dob, :address, :email, :phone, :blood_group, :dept, :parent_name, :parent_phone_no, :created_at, :updated_at
json.url student_detail_url(student_detail, format: :json)
