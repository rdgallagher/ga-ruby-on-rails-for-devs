class Employee < ActiveRecord::Base
  attr_accessible :address, :name, :start_date
  validates_presence_of :address, :name, :start_date

  belongs_to :role
end
