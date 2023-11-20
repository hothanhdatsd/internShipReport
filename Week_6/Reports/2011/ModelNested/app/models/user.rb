class User < ApplicationRecord
  has_one :product, dependent: :destroy, inverse_of: :user
  has_many :comments, inverse_of: :user
  accepts_nested_attributes_for :product
end
