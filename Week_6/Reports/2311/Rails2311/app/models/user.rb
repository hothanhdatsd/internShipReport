# frozen_string_literal: true

require_relative '../validators/users_validator'
class User < ApplicationRecord
  enum sex: { Male: 0, Female: 1 }
  validates :name, :date, :sex, presence: true
  validate :valid_age
  has_many :products, inverse_of: :user, dependent: :destroy
  has_one :post, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :post
  accepts_nested_attributes_for :products
end
