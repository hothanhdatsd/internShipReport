class AddFkToOrder < ActiveRecord::Migration[7.1]
  def change
    change_table :orders do |t|
      t.references :user
    end
  end
end
