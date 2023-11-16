Thêm khóa ngoại : references
class Book < ApplicationRecord
  belongs_to :author, class_name: "Patron"
end
- Thêm class name cụ thể 


class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

class Book < ApplicationRecord
  belongs_to :author
end
@book = @author.books.create(published_at: Time.now)
@author.destroy
- Xóa phụ thuộc

class Book < ApplicationRecord
  belongs_to :author
end
t.belongs_to :author, foreign_key: true
- Tạo ra author_id trong books

class Supplier < ApplicationRecord
  has_one :account
end
t.belongs_to :supplier
- trong table account tạo ra supplier_id

class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.timestamps
    end

    create_table :patients do |t|
      t.string :name
      t.timestamps
    end

    create_table :appointments do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
- Tạo ra một bảng trung gian nhận 2 physiicians và pattients lưu many_many

class CreateAssembliesAndParts < ActiveRecord::Migration[7.1]
  def change
    create_table :assemblies do |t|
      t.string :name
      t.timestamps
    end

    create_table :parts do |t|
      t.string :part_number
      t.timestamps
    end

    create_table :assemblies_parts, id: false do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end
end
- has_and_belongs_to_many quan hệ nhiều nhiều

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end
 create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true
      t.timestamps
   end
 - Tạo bảng pictures lưu trữ giá trị chung của 2 bảng employee và product
 
 
 find() : Tìm theo id
 take() : lấy data
 first 
 User.order(:age).second : lấy data thứ 2 theo cột age
 User.where(age:25) : lấy user có age = 25
 
 
 class Person
  include ActiveModel::AttributeMethods

  attribute_method_prefix 'reset_'
  attribute_method_suffix '_highest?'
  define_attribute_methods 'age'

  attr_accessor :age

  private
    def reset_attribute(attribute)
      send("#{attribute}=", 0)
    end

    def attribute_highest?(attribute)
      send(attribute) > 100
    end
end
person = Person.new
person.age = 110
person.age_highest? #true 
person.reset_age #0
person.age_highest? #false


class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :name

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    { 'name' => nil }
  end
end
json = { name: 'Bob' }.to_json
person = Person.new
person.from_json(json)
person.name # Bob


---------------------------------------------------------------------------- QUERY-------------------------------------------------------------------------

User.group(:age).count : nhóm theo tuổi và đếm
User.limit(5) : lấy giới hạn 5 giá trị
User.off(5).limit(2) : bỏ qua 5 gíá trị và lấy 2 giá trị
User.order(age: :desc) : Sắp xếp theo tuổi giảm dần
User.pluck(:name) : Lấy cột name
User.sum(:age) : Lấy tổng tuổi
User.distinct.pluck(:age) : Lấy tên không trùng lặp
User.where.not(age: 20)

