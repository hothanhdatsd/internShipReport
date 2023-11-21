class ChangeColumnDefaultPost < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :status, from: false, to: true
  end
end
