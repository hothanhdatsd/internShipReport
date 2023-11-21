class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, :foreign_key => true
      t.string :address 
      t.string :city 
      t.timestamps
    end
  end
end
