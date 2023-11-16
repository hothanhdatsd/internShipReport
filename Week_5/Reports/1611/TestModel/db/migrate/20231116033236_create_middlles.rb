# frozen_string_literal: true

class CreateMiddlles < ActiveRecord::Migration[7.1]
  def change
    create_table :middlles do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
    end
  end
end
