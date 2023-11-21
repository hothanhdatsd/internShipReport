class User < ApplicationRecord
  validates :name, presence: true
  has_one :address, dependent: :destroy, inverse_of: :user
  has_many :products, dependent: :destroy, inverse_of: :user
  has_many :posts
  has_many :orders
  has_one :test
  accepts_nested_attributes_for :address, :products
#   , reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
# , reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
