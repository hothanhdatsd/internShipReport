# frozen_string_literal: true

# import data
require 'csv'
require 'faraday'
class Importer
  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  def self.import_user(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      user_data = {
        name: row['name'],
        avatar: row['avatar'],
        sex: row['sex']
      }
      Importer.post_data(user_data)
    end
  end

  private

    def self.post_data(users)
      response = Importer.url.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = users.to_json
      end
    end

  def self.url
    @url ||= Faraday.new(url: API_URL)
  end
end

Importer.import_user("users.csv")
