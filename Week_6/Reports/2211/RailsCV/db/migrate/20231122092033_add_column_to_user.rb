class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.datetime :date 
      t.boolean :sex, default: false
    end
  end
end
