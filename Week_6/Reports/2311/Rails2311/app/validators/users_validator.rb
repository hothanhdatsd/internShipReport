# frozen_string_literal: true

def valid_age
  return unless age.present? && age <= 0

  errors.add(:age, 'must be greater than 0')
end
