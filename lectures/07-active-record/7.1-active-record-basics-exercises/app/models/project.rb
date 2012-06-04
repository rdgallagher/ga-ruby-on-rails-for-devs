class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name

  has_many :employee_projects
  has_many :employees, through: :employee_projects

  validates_presence_of :name
  validate :positive_employees_count

  after_initialize :init
  before_validation :update_employees_count

  private

    def init
      self.employees_count ||= 0
    end

    def update_employees_count
      self.employees_count = self.employees.count
    end

    def positive_employees_count
      errors.add(:employees_count, "Must be positive") if self.employees_count < 0
    end
end
