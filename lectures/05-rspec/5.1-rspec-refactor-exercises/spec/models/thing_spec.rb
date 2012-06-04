require 'spec_helper'

describe Thing do
  
  context "with a name" do
    
    let(:thing) { Thing.new }
    
    before(:each) do
      thing.name = "Name"
    end
    
    it "is valid" do
      thing.should be_valid
    end
    
    it "can be persisted" do
      thing.save.should be_true
      Thing.count.should == 1
    end

  end

  context "with validations" do
    before { Fabricate(:thing).save! }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

end
