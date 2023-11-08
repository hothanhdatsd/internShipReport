# frozen_string_literal: true

# export to docx
class ExportDocx
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  def self.export_table(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    create_table(data)

    response.success? ? response : 'failed to get list user'
  end

  def self.create_table(data)
    doc = Caracal::Document.new('TableApi.docx')
    doc.p do
      text 'API Table'
    end
    headers = %w[Id Name Sex Active Avatar Created_at]
    table_data = [headers] + data.map { |item| headers.map { |header| item[header.downcase] } }
    generate_style(table_data, doc)
    doc.save
  end

  def self.generate_style(table_data, doc)
    doc.table table_data, border_size: 4 do
      cell_style rows[0], background: '3366cc', color: 'ffffff', bold: true

      (1..table_data.length - 1).each do |row_index|
        active_value = table_data[row_index][3]
        cell_style rows[row_index], background: '#e91e63' if active_value != true
      end
    end
  end

  def self.url
    @url ||= Faraday.new(url: API_URL)
  end
end
