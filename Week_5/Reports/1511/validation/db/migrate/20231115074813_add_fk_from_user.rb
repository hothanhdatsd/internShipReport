class AddFkFromUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :product, foreign_key: true
  end
end
