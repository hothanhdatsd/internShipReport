# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, inverse_of: :post
end
