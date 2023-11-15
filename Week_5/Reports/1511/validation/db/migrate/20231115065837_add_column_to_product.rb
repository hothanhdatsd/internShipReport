class AddColumnToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :date_start, :string 
    add_column :products, :date_end, :string
  end
end
