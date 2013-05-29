class Note < ActiveRecord::Base
  belongs_to :company
  has_many :tags

  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true
  attr_accessible :company, :text, :attached_assets_attributes, :company_id

end
