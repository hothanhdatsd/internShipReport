class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sex, :integer, limit: 1
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
