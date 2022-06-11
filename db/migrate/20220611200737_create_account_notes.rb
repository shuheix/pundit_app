class CreateAccountNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :account_notes, comment: 'アカウントとノートの中間テーブル' do |t|
      t.references :account, foreign_key: true
      t.references :note, foreign_key: true
      t.timestamps
    end
    add_index :account_notes, [:account_id, :note_id], unique: true
  end
end
