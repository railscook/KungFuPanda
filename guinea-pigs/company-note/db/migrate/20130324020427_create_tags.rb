class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :note_id
      t.string :text

      t.timestamps
    end
  end
end
