class Tag < ActiveRecord::Base
  attr_accessible :note_id, :text
  belongs_to :notes
end
