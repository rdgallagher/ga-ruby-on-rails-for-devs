class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name

  validates_presence_of :employees_count
  validates_presence_of :name

  has_many :employee_projects
  has_many :employees, through: :employee_projects

  before_validation :update_employees_count

  validate :positive_employees_count

  private

    def update_employees_count
      self.employees_count = self.employees.count
    end

    def positive_employees_count
      errors.add(:employees_count, "Must be a positive integer") unless self.employees_count.integer? and self.employees_count > 0
    end
end
