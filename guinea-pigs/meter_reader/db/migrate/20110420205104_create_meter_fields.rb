class CreateMeterFields < ActiveRecord::Migration
  def self.up
    create_table :meter_fields do |t|
      t.integer :meter_id
      t.string :name
      t.string :data

      t.timestamps
    end
  end

  def self.down
    drop_table :meter_fields
  end
end
