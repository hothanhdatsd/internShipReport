class AddCommnetsCount < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :comments_count, :integer, default: 0
  end
end
