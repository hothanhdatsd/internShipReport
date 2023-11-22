# frozen_string_literal: true

# User
class User < ApplicationRecord
  has_one :product, inverse_of: :user, dependent: :destroy
  enum sex: %i[male,female]
  validates :name, :age, presence: true
  accepts_nested_attributes_for :product
end
