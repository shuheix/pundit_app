class AddReferenceColumnsToNotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :company, foreign_key: true, null: false
    add_reference :notes, :group, foreign_key: true
    add_reference :notes, :account, foreign_key: true
  end
end
