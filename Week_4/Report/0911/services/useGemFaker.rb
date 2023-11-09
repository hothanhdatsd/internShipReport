# frozen_string_literal: true

require 'faker'
require 'faraday'
# class user
class Fake
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  attr_reader :name, :avatar, :sex

  def initialize(hash)
    @name = hash['name']
    @avatar = hash['avatar']
    @sex = hash['sex']
    @created_at = DateTime.now.to_s
  end

  def self.post_data
    url.post do |req|
      req.body = {
        name: Faker::Name.name,
        avatar: Faker::Avatar.image,
        sex: Faker::Gender.binary_type,
        active: Faker::Boolean.boolean
      }
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

