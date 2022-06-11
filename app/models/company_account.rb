class CompanyAccount < ApplicationRecord
  belongs_to :company
  belongs_to :account
end
