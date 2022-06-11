class Company < ApplicationRecord
  has_many :comapny_accounts
  has_many :accounts, through: :comapny_accounts
end
