Serialize là một phương thức giúp bạn chuyển đổi một trường của mô hình ActiveRecord thành một đối tượng Ruby có thể được lưu trữ trong cơ sở dữ liệu. Thông thường, serialize được sử dụng để lưu trữ các đối tượng không phải là kiểu dữ liệu cơ bản như Hash, Array, hoặc các đối tượng tùy chỉnh.


- Thêm một cột preferences vào bảng user
class AddPreferencesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :preferences, :string
  end
end

- Có một trường tên là preferences chuyển đổi data thành JSON 
class User < ApplicationRecord
  serialize :preferences, coder: JSON 
end

- thêm giá trị và cập nhật 
user = User.new
user.preferences = { key: 'value', another_key: 'another_value' }
user.save

