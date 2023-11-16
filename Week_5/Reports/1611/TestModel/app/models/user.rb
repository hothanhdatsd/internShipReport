# frozen_string_literal: true

require_relative '../validator/GoodnessValidator'
require_relative '../validator/user_callbacks'
# User class
class User < ApplicationRecord
  include UserCallbacks
  has_many :images, as: :imageable, dependent: :destroy
  validates :name, :age, presence: true
  has_many :middlles, dependent: :destroy
  validates_with GoodnessValidator
  scope :old, -> { where('age > ?', 25) }
  scope :teen, -> { where('age < ?', 25) }
end


# User.group(:age).count : nhóm theo tuổi và đếm
# User.limit(5) : lấy giới hạn 5 giá trị
# User.off(5).limit(2) : bỏ qua 5 gíá trị và lấy 2 giá trị
# User.order(age: :desc) : Sắp xếp theo tuổi giảm dần
# User.pluck(:name) : Lấy cột name
# User.sum(:age) : Lấy tổng tuổi
# User.distinct.pluck(:age) : Lấy tên không trùng lặp
# User.where.not(age: 20)