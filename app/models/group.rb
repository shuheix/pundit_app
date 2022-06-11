class Group < ApplicationRecord
  has_many :account_groups
  has_many :accounts, through: account_groups
  belongs_to :company
end
