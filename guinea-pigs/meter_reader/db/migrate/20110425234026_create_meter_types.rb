class CreateMeterTypes < ActiveRecord::Migration
  def self.up
    create_table :meter_types do |t|
      t.string :name
      t.float :amount
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :meter_types
  end
end
