class Role < ActiveRecord::Base
  attr_accessible :department, :name
  validates_presence_of :department, :name

  has_many :employees
end
