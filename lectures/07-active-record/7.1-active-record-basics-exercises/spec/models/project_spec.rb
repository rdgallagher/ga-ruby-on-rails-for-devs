require 'spec_helper'

describe Project do
  context "attributes" do
    it { should respond_to :name }
    it { should respond_to :employees_count }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :employees_count }
  end

  context "associations" do
    it { should have_many :employee_projects }
    it { should have_many(:employees).through(:employee_projects) }
  end
end
