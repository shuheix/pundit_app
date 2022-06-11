class CreateAccountGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :account_groups, comment: 'アカウントとグループの中間テーブル' do |t|
      t.references :account, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
    add_index :account_groups, [:account_id, :group_id], unique: true
  end
end
