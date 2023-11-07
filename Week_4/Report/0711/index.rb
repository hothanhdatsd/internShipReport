# frozen_string_literal: true

require 'faraday'
require 'caracal'
require 'caxlsx'
require 'chunky_png'
require 'docx'
require 'gruff'
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
    # Docx::Document.new('ApiTable.docx')
    # Axlsx::Package.new do |p|
    #   p.workbook.add_worksheet(name: 'Pie Chart') do |sheet|
    #     sheet.add_row %w[Gender Count]

    #     sheet.add_row ['male', gender_counts['male']]
    #     sheet.add_row ['female', gender_counts['female']]

    #     sheet.add_chart(Axlsx::Pie3DChart, start_at: [0, 5], end_at: [10, 20], title: 'Pie Chart') do |chart|
    #       chart.add_series data: sheet['B2:B3'], labels: sheet['A2:A3'], colors: %w[FF0000 00FF00]
    #     end
    #   end

    #   p.serialize('simple.xlsx')
    # end

    g = Gruff::Pie.new
    g.title = 'Gender Distribution'
    g.data('Male', gender_counts['male'])
    g.data('Female', gender_counts['female'])
    g.write('gender_chart.png')

    current_directory = Dir.pwd
    image_filename = 'gender_chart.png'
    image_path = File.join(current_directory, image_filename)

    Caracal::Document.save 'ApiTable.docx' do |docx|
      docx.img image_path do
        width   250
        height  200
        align   :left
      end
    end
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
