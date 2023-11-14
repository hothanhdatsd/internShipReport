rails db:drop    
Dropped database 'my_app_development'
Dropped database 'my_app_test'
- Tạo database trên môi trường dev và test               

rails db:create    
Created database 'my_app_development'
Created database 'my_app_test'
- Xóa database trên môi trường dev và test    

rails g migration create_user : Tạo một migration tạo bảng users gồm name, email, age
class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name 
      t.string :email 
      t.integer :age
      t.timestamps
    end
  end
end

- Thêm các ví dụ :

rails g  migration removeFullNameFromUsers fullname:string : tạo một migration để xóa cột fullname
rails g  migration AddFullNameToUsers fullname:string:index : Tạo một migration để thêm cột và index cho fullname
rails generate migration AddUserRefToProducts user:references : Tạo một user_id là khóa ngoại cho bảng Product
rails db:rollback : trở về lại một bước
rails db:migrate:redo : trở về một bước và thực hiện lại
rails g migration removeDescriptionFromUsers desc:string : xóa cột desc kiểu string trong bảng users
rails db:migrate:status : xem trang thai của các migration
rails db:migrate:down VERSION=***********
rails db:schema:dump : làm mới lại schema 

create_table :users do |t|
  t.string :name, index: true : Thêm cột name và index
  t.string :email, index: { unique: true, name: 'unique_emails' } : Thêm cột và index , thêm thuộc tính unique 
  create_join_table :products, :categories, column_options: { null: true } : Tạo join
end

change_table :products do |t|
  t.remove :description, :name : Xóa cột
  t.string :part_number : Thêm cột
  t.index :part_number : Thêm index
  t.rename :upccode, :upc_code : Đổi tên cột
end


add_column :products, :part_number, :string : thêm cột part_number kiểu string vào bảng products
remove_column :products, :part_number, :string : xóa cột part_number khỏi bảng products
add_reference :products, :users, foreign_key: true : tạo một khóa ngoại trong bảng products liên kết với bảng users
change_column :products, :part_number, :text : thay đổi cột part_number thành kiểu dữ liệu text
change_column_null :products, :name, false : Thay đổi không cho cột name trong bảng products có thể null
change_column_default :products, :approved, from: true, to: false : Thay đổi cột approve default từ true thành false
remove_reference :products, :users, foreign_key: true : Xóa khóa ngoại ở bảng products
add_index :products, :part_number : Thêm index cho cột part_number ở bảng products	

require_relative "20231114094833_create"
revert create 
- import và chạy 2 migration cùng lúc

