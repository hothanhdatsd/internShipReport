class Address < ApplicationRecord
  validates :address, :city, presence: true,format: { with: /\A[A-Z a-z]+\z/, message: "only allows letters" }
  belongs_to :user, inverse_of: :address
end
