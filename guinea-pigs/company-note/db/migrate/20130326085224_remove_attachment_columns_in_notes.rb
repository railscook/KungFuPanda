class RemoveAttachmentColumnsInNotes < ActiveRecord::Migration
  def up
    remove_column :notes, :attachment
  end

  def down
   add_column :notes, :attachment, :string
  end
end
