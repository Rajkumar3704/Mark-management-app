class StMark < ApplicationRecord
    validates :mark, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :s_id, presence: true
    validates :course_id, presence: true
    validates :credit, presence: true
    validates :s_id, uniqueness: { scope: :course_id, message: "Already You give a mark!" }
      
end
