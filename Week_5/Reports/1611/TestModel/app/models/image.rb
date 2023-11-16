# frozen_string_literal: true

#  class Image
class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
