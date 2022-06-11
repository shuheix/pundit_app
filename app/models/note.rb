class Note < ApplicationRecord
  has_many :account_notes
  has_many :accounts, through: :account_notes
end
