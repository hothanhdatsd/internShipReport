# frozen_string_literal: true

require 'csv'
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
  end

  def get_list_user(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    export_table(data)

    response.success? ? response : 'failed to get list user'
  end

  def import_user
    CSV.foreach('users.csv', headers: true) do |row|
      user_data = {
        name: row['name'],
        avatar: row['avatar'],
        sex: row['sex']
      }
      response = url.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = user_data.to_json
      end
      if response.status == 201
        puts 'Successfully.'
      else
        puts 'Error.'
      end
    end
  end

  private

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
user = User.new({})
p user.import_user
