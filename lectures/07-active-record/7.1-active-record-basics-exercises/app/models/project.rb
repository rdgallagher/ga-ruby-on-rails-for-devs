class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name

  validates_presence_of :employees_count
  validates_presence_of :name

  has_many :employee_projects
  has_many :employees, through: :employee_projects
end
