class Product < ApplicationRecord
  enum status: [:solve, :pending]
  belongs_to :user, inverse_of: :product 
end
