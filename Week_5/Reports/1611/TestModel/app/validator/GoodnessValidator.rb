# frozen_string_literal: true

# Trong file app/validators/goodness_validator.rb
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    return unless record.name == 'Evil'

    record.errors.add :base, 'This person is evil'
  end
end
