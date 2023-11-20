class RenameColumnUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :comments_count, :comment_count
  end
end
