class RemoveColumnOrder < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :users_id
  end
end
