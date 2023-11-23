class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :house_number 
      t.string :area 
      t.string :city 
      t.references :employee
      t.timestamps
    end
  end
end
