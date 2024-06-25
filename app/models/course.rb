class Course < ApplicationRecord
    validates :credits,:faculty_id,:course_title, presence: true
    validates :course_code, presence: true, uniqueness: true
    has_and_belongs_to_many :student_details
end
