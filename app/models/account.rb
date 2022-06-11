class Account < ApplicationRecord
  has_many :notes  # 中間テーブルを経由しない
  has_many :account_notes
  has_many :collaboration_notes, through: :account_notes, source: :note # 命名を指定
  has_many :company_account
  has_many :company, through: :company_account
  has_many :account_groups
  has_many :groups, through: :account_groups
end
