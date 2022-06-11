class AccountNote < ApplicationRecord
  belongs_to :account
  belongs_to :note
end
