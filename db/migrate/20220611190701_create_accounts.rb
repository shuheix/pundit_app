class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts, comment: 'accountのテーブル' do |t|
      t.string :name, comment: '名前'
      t.timestamps
    end
    add_index :accounts, :name, unique: true
  end
end
