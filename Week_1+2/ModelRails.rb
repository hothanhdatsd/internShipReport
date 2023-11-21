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


------------------------------------------------------------QUERY-------------------------------------------------------------------------

User.group(:age).count : nhóm theo tuổi và đếm
User.limit(5) : lấy giới hạn 5 giá trị
User.off(5).limit(2) : bỏ qua 5 gíá trị và lấy 2 giá trị
User.order(age: :desc) : Sắp xếp theo tuổi giảm dần
User.pluck(:name) : Lấy cột name
User.sum(:age) : Lấy tổng tuổi
User.distinct.pluck(:age) : Lấy tên không trùng lặp
User.where.not(age: 20)


---------------------------------------------------------Change_table---------------------------------------------------

add_column :table_name, :column_name, :datatype
remove_column :table_name, :column_name
change_column :table_name, :column_name, :new_datatype
rename_column :table_name, :old_column_name, :new_column_name
change_column :table_name, :column_name, :text
add_reference :products, :order, foreign_key: true
add_reference :users, :role
add_index :products, :part_number
change_column_null :products, :name, false
change_column_default :products, :approved, from: true, to: false
add_belongs_to :taggings, :taggable, polymorphic: true

--------
accepts_nested_attributes_for :product
-- resset 
User.find_each{|u| User.reset_counters(u.id, :comments)}

----------------------------------------------------------Association-----------------------------------------------

belongs_to : 
has_many
has_one
has_and_belongs_to_many
has_one :through và has_many :through
Polymorphic Associations

-----------thêm khóa ngoại----------------------
change_table :orders do |t|
 t.references :user
 t.belongs_to :user
end

add_column :testts, :user_id, :integer
add_reference :testts, :user, foreign_key: true
remove_reference :products, :user, foreign_key: true, index: false
add_belongs_to :taggings, :taggable, polymorphic: true

-----------------------------------------------------------Validates--------------------------------

validates :name, presence: true
validates :email, confirmation: true
validates :email_confirmation, presence: true, if: :email_changed?
validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
validates :size, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }
validates :size, exclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }
validates :name, length: { minimum: 2 }
validates :bio, length: { maximum: 500 }
validates :password, length: { in: 6..20 }
validates :registration_number, length: { is: 6 }
validates :bio, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
validates :points, numericality: true
validates :games_played, numericality: { only_integer: true }
validates :name, uniqueness: { scope: :year,
    message: "should happen once per year" }
validates :name, uniqueness: { case_sensitive: false }
validates :age, numericality: true, on: :update
validates :name, presence: { strict: true }

class Order < ApplicationRecord
  validates :card_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
end

------------------------------------------------------------------------CallBacks--------------------------------------------------------------

before_validation
after_validation
before_save
around_save
before_create
around_create
after_create
after_save
after_commit/after_rollback


