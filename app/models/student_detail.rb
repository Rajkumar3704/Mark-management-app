class StudentDetail < ApplicationRecord
    belongs_to :user
    validate :dob_must_be_in_the_past
    has_and_belongs_to_many :courses
    private

    def dob_must_be_in_the_past
        if dob.present? && dob >= Date.today
        errors.add(:dob, "must be in the past")
        end
    end
end
