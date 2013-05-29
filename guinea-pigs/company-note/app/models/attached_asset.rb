class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  attr_accessible :asset, :asset_file_name

  validates :asset, :attachment_presence => true

  def image?
    asset_content_type =~ /image/
  end

end
