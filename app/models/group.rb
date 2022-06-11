class Group < ApplicationRecord
  has_many :account_groups
  has_many :accounts, through: account_groups
  has_many :notes
  belongs_to :company
end
