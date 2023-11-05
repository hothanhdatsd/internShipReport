# frozen_string_literal: true

require 'faraday'

conn = Faraday.new(url: 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users')

# lay thong tin user
response = conn.get do |req|
  req.params['id'] = '186'
end

p response

# tao user

user = {
  'name' => 'Thanh Dat',
  'sex' => 'male',
  'active' => 'true',
  'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'
}

respone = conn.post do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = user.to_json
end
p respone
user_id = 4

# xoa user

response = conn.delete "/users/#{user_id}"

if response.status == 200
  puts "Người dùng với ID #{user_id} đã được xóa thành công."
else
  puts 'Không thể xóa người dùng.'
end
