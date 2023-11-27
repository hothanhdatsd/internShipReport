# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :age, presence: true
  validates_associated :products
  has_rich_text :name
  has_many :products, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :products, reject_if: ->(attributes) { attributes['title'].blank? }, allow_destroy: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name age]
  end

  scope :search_user, lambda { |search|
    search&.squish! if search
    search_params = search.present? ? { age_cont: search } : {}

    ransack(search_params.merge(attributes: ransackable_attributes)).result(distinct: true)
  }

  scope :search_with_name, lambda { |search_term|
    if search_term.present?
      user_ids = User.with_rich_text_name.select do |user|
        user.name.body.to_plain_text.downcase.include?(search_term.downcase)
      end.pluck(:id)
      where(id: user_ids)
    else
      all
    end
  }
end
