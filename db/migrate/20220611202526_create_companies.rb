class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies, comment:'会社' do |t|
      t.string :name, null: false, comment: '会社名'

      t.timestamps
    end
    add_index :companies, :name
  end
end
