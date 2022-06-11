class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes, comment:'ノート' do |t|
      t.string :title, comment: 'タイトル'
      t.text :content, comment: '内容'
      t.timestamps
    end
  end
end
