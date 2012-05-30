require 'spec_helper'

describe Employee do
  context "attributes" do
    it { should respond_to :name }
    it { should respond_to :address }
    it { should respond_to :start_date }
  end

  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :start_date }
  end

  context "associations" do
    it { should belong_to :role }
  end

  context "fabricators" do
    it "should fabricate a valid Employee" do
      Fabricate(:employee).should be_valid
    end
  end
end
