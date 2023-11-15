class Account < ApplicationRecord
  belongs_to :supplier
  has_one :accounts_history
end
