require 'spec_helper'

describe "things/new.html.haml" do

  before(:each) do
    assign(:thing, Thing.new)
  end

  it "renders new thing form" do
    render
    assert_select "form", count: 1
    assert_select "input[name='thing[name]']", count: 1
    assert_select "input[name='thing[description]']", count: 1
    assert_select "input[type=submit]"
  end
  
end
