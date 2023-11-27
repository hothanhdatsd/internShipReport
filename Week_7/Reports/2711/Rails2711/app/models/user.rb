# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :age, :email, presence: true
  validates_associated :products
  has_rich_text :name
  has_many :products, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :products, reject_if: ->(attributes) { attributes['title'].blank? }, allow_destroy: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name age test has_rich_text]
  end

  scope :search_user, lambda { |search|
    search&.squish! if search
    search_params = search.present? ? { age_cont: search } : {}
    ransack(search_params.merge(attributes: ransackable_attributes)).result(distinct: true)
  }


end
