class Faculty < ApplicationRecord
    belongs_to :user
    validate :dob_must_be_in_the_past
  
    private

    def dob_must_be_in_the_past
        if dob.present? && dob >= Date.today
        errors.add(:dob, "must be in the past")
        end
    end
end
