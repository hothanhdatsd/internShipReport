class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user
      t.string :title
      t.timestamps
    end
  end
end
