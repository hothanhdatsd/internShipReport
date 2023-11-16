# frozen_string_literal: true

# app/models/concerns/user_callbacks.rb
module UserCallbacks
  extend ActiveSupport::Concern

  included do
    before_validation :ensure_name_has_a_value
    before_create :upcase_name
    after_touch do |_user|
      puts 'You have touched an object'
    end
  end

  private

  def ensure_name_has_a_value
    return if name.present?

    self.name = age
  end

  def upcase_name
    self.name = name.upcase
  end
end
