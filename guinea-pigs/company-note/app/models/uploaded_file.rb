class UploadedFile < ActiveRecord::Base
  attr_accessible :name
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }
  attr_accessible :asset, :asset_file_name

end
