# frozen_string_literal: true

require 'faraday'
# class user
class User
  attr_reader :name, :avatar, :sex

  def initialize(hash)
    @name = hash['name']
    @avatar = hash['avatar']
    @sex = hash['sex']
    @created_at = DateTime.now.to_s
  end

  def create_user
    response = url.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = to_json
    end
    response.status == 201 || response.status == 200 ? 'created successfully' : 'failed to create user create'
  end

  def update_user(id, other)
    response = url.put do |req|
      req.url id.to_s
      req.headers['Content-Type'] = 'application/json'
      req.body = other.to_json
    end
    response.status == 201 || response.status == 200 ? 'update successfully' : 'failed to update user '
  end

  def delete_user(id)
    response = url.delete do |req|
      req.url id.to_s
      req.headers['Content-Type'] = 'application/json'
    end
    response.status == 201 || response.status == 200 ? 'deleted successfully' : 'failed to delete user'
  end

  def get_list_user(condition, value)
    response = url.get do |req|
      check_params(condition, value, req)
      req.headers['Content-Type'] = 'application/json'
    end
    response.status == 201 || response.status == 200 ? response : 'failed to get list user'
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
    Faraday.new(url: 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users')
  end
end

user = User.new({
                  'name' => 'Thanh Dat updated',
                  'sex' => 'male',
                  'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'
                })

p user.update_user(202, {
                     'name' => 'Phi Hoan fukboiz',
                     'sex' => 'female',
                     'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg'
                   })
# p user.get_list_user('id', '198')
