class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, :foreign_key => true
      t.string :title
      t.timestamps
    end
  end
end
