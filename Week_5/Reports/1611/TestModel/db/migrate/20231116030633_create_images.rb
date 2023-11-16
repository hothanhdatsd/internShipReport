# frozen_string_literal: true

# tao image polymorphic
class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true
      t.timestampsw
    end
  end
end
