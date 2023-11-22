# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, inverse_of: :product
end
