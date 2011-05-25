class MeterField < ActiveRecord::Base
	belongs_to :meter
  validates_presence_of :data
end
