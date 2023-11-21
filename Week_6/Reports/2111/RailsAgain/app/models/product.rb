class Product < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  belongs_to :user, inverse_of: :products
end
