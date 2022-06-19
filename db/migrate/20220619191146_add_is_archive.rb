class AddIsArchive < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :is_archived, :boolean, default: false, comment: 'archiveされているか'
  end
end
