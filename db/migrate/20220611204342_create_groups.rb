class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups, comment: 'グループ' do |t|
      t.string :name, null: false, index:{ unique: true }, comment: 'グループ名'
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
