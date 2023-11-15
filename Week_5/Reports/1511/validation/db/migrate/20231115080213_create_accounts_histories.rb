class CreateAccountsHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts_histories do |t|
      t.string :credit_rating
      t.timestamps
    end
  end
end
