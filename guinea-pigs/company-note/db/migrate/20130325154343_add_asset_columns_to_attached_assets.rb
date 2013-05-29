class AddAssetColumnsToAttachedAssets < ActiveRecord::Migration
  def self.up
    add_attachment :attached_assets, :asset
  end

  def self.down
    remove_attachment :attached_assets, :asset
  end
end
