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

  def self.get_list_user(condition = nil, value = nil)
    response = url.get do |req|
      check_params(condition, value, req) if condition && value
    end
    data = JSON.parse(response.body)
    gender_counts = Hash.new(0)

    data.each do |item|
      gender = item[condition]
      gender_counts[gender.to_s] += 1
    end
    gender_counts
  end

  def self.check_params(condition, value, req)
    case condition
    when 'active'
      req.params['active'] = value
    when 'sex'
      req.params['sex'] = value
    when 'id'
      req.params['id'] = value
    end
  end

  def self.url
    @url ||= Faraday.new(url: API_URL)
  end

  private

  def to_json(*_args)
    JSON.generate(self)
  end
end
