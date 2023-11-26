# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, presence: true
  belongs_to :user, inverse_of: :products
end
