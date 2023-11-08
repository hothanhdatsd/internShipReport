# frozen_string_literal: true

require 'csv'
require 'httparty'
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

  def get_list_user(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    export_table(data)

    response.success? ? response : 'failed to get list user'
  end
  
  def self.import_user 
    CSV.foreach('users.csv', headers: true) do |row|
      user_data = {
        name: row['name'],
        avatar: row['avatar'],
        sex: row['sex'],
      }
      response = HTTParty.post(API_URL, body: user_data.to_json, headers: { 'Content-Type' => "application/json" })
      if response.success?
        puts "User #{user_data['name']} imported successfully."
      else
        puts "Failed to import user #{user_data['name']}. Error: #{response.code} - #{response.body}"
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
    @connect ||= Faraday.new(url: API_URL)
  end
end


p User.import_user
