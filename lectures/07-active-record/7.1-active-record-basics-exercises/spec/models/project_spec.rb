require 'spec_helper'

describe Project do
  context "attributes" do
    it { should respond_to :name }
    it { should respond_to :employees_count }
    it { should respond_to :employees }
  end

  context "validations" do
    it { should validate_presence_of :name }
  end

  context "associations" do
    it { should have_many :employee_projects }
    it { should have_many(:employees).through(:employee_projects) }
  end

  context "callbacks" do
    describe "before validation" do
      before(:each) do
        @project = Project.create!(name: 'Test Project')
      end

      it "should update employee count" do
        expect {@project.employees << Fabricate(:employee)}.to change{@project.employees_count}.by(1)
      end
    end
  end
end
