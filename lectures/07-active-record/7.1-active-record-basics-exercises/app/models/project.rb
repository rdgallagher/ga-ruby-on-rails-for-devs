class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name

  validates_presence_of :employees_count
  validates_presence_of :name
end
