class CreateCompanyAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :company_accounts, comment: '会社とアカウントの中間テーブル' do |t|
      t.references :account, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
    add_index :company_accounts, [:account_id, :company_id], unique: true
  end
end
