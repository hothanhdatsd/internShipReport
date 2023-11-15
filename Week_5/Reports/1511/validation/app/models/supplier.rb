class Supplier < ApplicationRecord
  has_many :accounts
  has_one :account_history, through: :account
end
