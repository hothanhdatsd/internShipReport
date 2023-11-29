# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :age, :email, presence: true
  validates_associated :products

  has_one_attached :picture
  has_rich_text :name
  has_many :products, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :products, reject_if: ->(attributes) { attributes[:title].blank? }, allow_destroy: true
  has_one :name, class_name: 'ActionText::RichText', as: :record

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name age email updated_at created_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[products rich_text_name]
  end

  # scope :search_user, lambda { |search|
  #   search&.squish! if search
  #   search_params = search.present? ? { age_cont: search } : {}
  #   ransack(search_params.merge(attributes: ransackable_attributes)).result(distinct: true)
  # }
end
