# frozen_string_literal: true

# @@ :  Biến class được chia sẻ và truy cập bởi tất cả các thể hiện (instances)
# của lớp và được sử dụng chủ yếu để lưu trữ thông tin mà tất cả các thể hiện của lớp cần chia sẻ.

# @ được gọi là biến instance. Mỗi thể hiện (instance) của lớp có một bản sao riêng biệt của các biến
# instance và không được chia sẻ giữa các thể hiện khác.

# ||= giúp kiểm tra xem biến đã được khởi tạo chưa và nếu chưa, nó sẽ gán giá trị mới cho biến đó

# private va protected đều không thể gọi từ bên ngoài lớp nhưng protected có thể được gọi từ lớp con của nó

require 'faraday'
require 'caracal'
# class user
class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  attr_reader :name, :avatar, :sex

  def initialize(hash)
    @name = hash['name']
    @avatar = hash['avatar']
    @sex = hash['sex']
    @created_at = DateTime.now.to_s
    @connect
  end

  def create_user
    response = url.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { name: @name, avatar: @avatar, sex: @sex, created_at: @created_at }.to_json
    end
    response.success? ? 'created successfully' : 'failed to create user create'
  end

  def update_user(id, other)
    response = url.put do |req|
      req.url id.to_s
      req.headers['Content-Type'] = 'application/json'
      req.body = other.to_json
    end
    response.success? ? 'update successfully' : 'failed to update user '
  end

  def delete_user(id)
    response = url.delete do |req|
      req.url id.to_s
      req.headers['Content-Type'] = 'application/json'
    end
    response.success? ? 'deleted successfully' : 'failed to delete user'
  end

  def get_list_user(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    export_table(data)

    response.success? ? response : 'failed to get list user'
  end

  private

  def export_table(data)
    doc = Caracal::Document.new('ApiTable.docx')
    doc.p do
      text 'API Table' 
    end  
    headers = %w[Id Name Sex Active Avatar Created_at]
    table_data = [headers] +   data.map { |item| headers.map { |header| item[header.downcase] } }
    doc.table table_data, border_size: 4 do
      
      cell_style rows[0], background: '3366cc', color: 'ffffff', bold: true

      (1..table_data.length - 1).each do |row_index|
        active_value = table_data[row_index][3]
        p active_value
        if active_value != true
          cell_style rows[row_index], background: '#e91e63'
        else
        end
      end

    end
    doc.save
  end

  def check_params(condition, value, req)
    case condition
    when 'active'
      req.params['active'] = value
    when 'sex'
      req.params['sex'] = value
    when 'id'
      req.params['id'] = value
    end
  end

  def to_json(*_args)
    JSON.generate(self)
  end

  def url
    @connect ||= Faraday.new(url: API_URL)
  end
end

user = User.new({
                  'name' => 'Phi Hoan fukboizzzz',
                  'sex' => 'male',
                  'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'
                })
# user_update = {
#   'name' => 'Phi Hoan fukboiz12',
#   'sex' => 'female',
#   'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'
# }

# p user.update_user(210, user_update)
user.get_list_user
