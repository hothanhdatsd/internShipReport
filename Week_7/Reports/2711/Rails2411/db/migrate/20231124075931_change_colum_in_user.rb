# frozen_string_literal: true

class ChangeColumInUser < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :name, :text
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
