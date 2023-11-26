# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :age, presence: true
  validates_associated :products
  has_rich_text :name
  has_many :products, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :products, reject_if: ->(attributes) { attributes['title'].blank? }, allow_destroy: true
end
