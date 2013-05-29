class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :company_id
      t.string :text
      t.string :attachment

      t.timestamps
    end
  end
end
