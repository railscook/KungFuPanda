class Item < ActiveRecord::Base
  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true
  attr_accessible :title, :description, :attached_assets_attributes
end
