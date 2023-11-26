# frozen_string_literal: true

class ChangeColumnProducts < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :title, :text
  end
end
