class Company < ActiveRecord::Base
  attr_accessible :description, :name, :contact
  has_many :notes

  def self.sorted_by_name
     self.all.sort {|a,b| a.name.capitalize <=> b.name.capitalize}
  end
end
