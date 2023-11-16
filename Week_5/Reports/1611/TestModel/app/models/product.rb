# frozen_string_literal: true

# class product
class Product < ApplicationRecord
  belongs_to :user, inverse_of: :product
  has_many :images, as: :imageable, dependent: :destroy
  has_many :middlles, dependent: :destroy
end
