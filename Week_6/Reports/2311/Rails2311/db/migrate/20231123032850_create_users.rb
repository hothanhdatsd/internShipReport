class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.date :date

      t.timestamps
    end
  end
end
