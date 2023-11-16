# frozen_string_literal: true

class AddUserRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :user, foreign_key: true
  end
end
