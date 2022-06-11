class Note < ApplicationRecord
  has_many :account_notes
  has_many :accounts, through: :account_notes
  belongs_to :company
  belongs_to :group, optional: true
  belongs_to :account, optional: true
end
