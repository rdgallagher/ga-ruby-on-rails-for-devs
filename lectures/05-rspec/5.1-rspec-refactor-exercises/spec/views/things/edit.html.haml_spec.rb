require 'spec_helper'

describe "things/edit.html.haml" do

  before(:each) do
    @thing = Fabricate(:thing)
    assign(:thing, @thing)
  end

  it "renders the edit thing form" do
    render
    assert_select "form", count: 1
    assert_select "input[name='thing[name]']", count: 1, value: @thing.name
    assert_select "input[name='thing[description]']", count: 1, value: @thing.description
    assert_select "input[type=submit]"
  end
end
