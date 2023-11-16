- STI là một design pattern dựa trên ý tưởng dùng 1 bảng duy nhất để lưu trữ data của nhiều model bằng cách thừa kế từ một base model duy nhất.
- Polymorphic Associations là một loại Active Record Association, giúp tạo liên kết giữa 1 model với nhiều model khác thông qua 1 association duy nhất.
-----STI--------

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :password
      t.string :type 
      t.timestamps
    end
  end
end


class Product < ApplicationRecord
 validates :author, format: { with: /\A[a-zA-Z\s]+\z/,
  message: "only allows letters" }, allow_nil: true,presence: true
end

class Custom < Product

end

Tạo Custom.create(title: 'test') ActiveRecord sẽ tự động chuyển đổi để tạo 1 entry trong bảng Product với type: 'Custom'



----- Polymorphic Associations--------

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class User < ApplicationRecord
  has_many :images, as: :imageable
end

class Product < ApplicationRecord
  has_many :images, as: :imageable
end

Thiết lập mối quan hệ giữa 3 bảng, sử dụng bảng Image có 2 cột imageable_id và imageable_type lưu trữ id và type của bảng User và Product 
