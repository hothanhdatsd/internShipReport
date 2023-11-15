class User < ApplicationRecord
  validates :name, presence:  {message: "must be given please"}, length: {in: 6..20}, uniqueness: {case_sentitive: false}   # co phan biet hoa thuong 
  validates :email,presence: true, uniqueness: true, confirmation: true
  validates :email_confirmation, :role, presence: true
  has_many :products
  validates :product_id, presence: true
  validates :age, numericality: { only_integer: true, message: "must be a number" }  #chi chap nhan so'
  validates :role, inclusion: { in: %w(admin user),
    message: "%{value} is not a valid role" } #chi chap nhan gia tri la admin va user
end
