class Test < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :user_id, :integer
  end
end
