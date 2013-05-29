class AddAttachableIdColumnsToAttachedAssets < ActiveRecord::Migration
  def change
    add_column :attached_assets, :attachable_id, :integer
    add_column :attached_assets, :attachable_type, :string
  end
end
