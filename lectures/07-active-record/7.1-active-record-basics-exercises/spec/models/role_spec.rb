require 'spec_helper'

describe Role do
  context "attributes" do
    it { should respond_to :name }
    it { should respond_to :department }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :department }
  end

  context "associations" do
    it { should have_many :employees }
  end

  context "fabricators" do
    #TODO: Add specs to ensure that fabricators create valid objects
    it "should fabricate a valid Role" do
      Fabricate(:role).should be_valid
    end
  end
end
