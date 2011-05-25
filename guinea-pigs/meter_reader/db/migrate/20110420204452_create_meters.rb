class CreateMeters < ActiveRecord::Migration
  def self.up
    create_table :meters do |t|
      t.date :read_on

      t.timestamps
    end
  end

  def self.down
    drop_table :meters
  end
end
