# frozen_string_literal: true

class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.timestamps
    end
  end
end
