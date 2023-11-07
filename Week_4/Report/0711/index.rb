# frozen_string_literal: true

# @@ :  Biến class được chia sẻ và truy cập bởi tất cả các thể hiện (instances)
# của lớp và được sử dụng chủ yếu để lưu trữ thông tin mà tất cả các thể hiện của lớp cần chia sẻ.

# @ được gọi là biến instance. Mỗi thể hiện (instance) của lớp có một bản sao riêng biệt của các biến
# instance và không được chia sẻ giữa các thể hiện khác.

# ||= giúp kiểm tra xem biến đã được khởi tạo chưa và nếu chưa, nó sẽ gán giá trị mới cho biến đó

# private va protected đều không thể gọi từ bên ngoài lớp nhưng protected có thể được gọi từ lớp con của nó

require 'faraday'
require 'caracal'
require 'caxlsx'
require 'chunky_png'
require 'docx'
# class user
class User
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  attr_reader :name, :avatar, :sex

  def initialize(hash)
    @name = hash['name']
    @avatar = hash['avatar']
    @sex = hash['sex']
    @created_at = DateTime.now.to_s
  end

  def get_list_user(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    gender_counts = Hash.new(0)

    data.each do |item|
      gender = item['sex']
      gender_counts[gender] += 1
    end
    exort_chart(gender_counts)

    response.success? ? response : 'failed to get list user'
  end

  private

  def exort_chart(gender_counts)
    doc = Docx::Document.new("ApiTable.docx")
      Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: 'Pie Chart') do |sheet|
        sheet.add_row %w[Gender Count]
  
        sheet.add_row ['male', gender_counts['male']]
        sheet.add_row ['female', gender_counts['female']]
  
        sheet.add_chart(Axlsx::Pie3DChart, start_at: [0, 5], end_at: [10, 20], title: 'Pie Chart') do |chart|
          chart.add_series data: sheet['B2:B3'], labels: sheet['A2:A3'], colors: %w[FF0000 00FF00]
        end
      end
  
      p.serialize('simple.xlsx')
    end
  
    # Convert Excel file to PNG image
    require 'chunky_png'
  
    png = ChunkyPNG::Image.from_file('simple.xlsx')
    png.save('my_file.png')
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
    @url ||= Faraday.new(url: API_URL)
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
