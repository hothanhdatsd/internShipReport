class CreateTestts < ActiveRecord::Migration[7.1]
  def change
    create_table :testts do |t|
      t.string :name
      t.timestamps
    end
  end
end
