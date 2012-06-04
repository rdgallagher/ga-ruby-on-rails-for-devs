class Employee < ActiveRecord::Base
  attr_accessible :address, :name, :start_date
  validates_presence_of :address, :name, :start_date

  belongs_to :role
  has_many :employee_projects
  has_many :projects, through: :employee_projects
end
