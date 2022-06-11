class Account < ApplicationRecord
  has_many :account_notes
  has_many :notes, through: :account_notes
  has_many :company_account
  has_many :company, through: :company_account
  has_many :account_groups
  has_many :groups, through: :account_groups
  has_many :notes
end
