# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :addresses
  accepts_nested_attributes_for :addresses,
                                reject_if: proc { |att|
                                             att['house_number'].blank? || ['city'].blank? || ['area'].blank?
                                           }
end
