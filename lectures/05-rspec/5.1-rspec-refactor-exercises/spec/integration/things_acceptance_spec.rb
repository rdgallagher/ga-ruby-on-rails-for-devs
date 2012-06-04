require 'spec_helper'

feature "Things", js: true do

  scenario "are displayed in a table" do
    thing = Fabricate(:thing)
    visit "/things"
    page.should have_css "td", text: thing.name
  end

  scenario "can be displayed" do
    thing = Fabricate(:thing)
    visit "/things/#{thing.id.to_s}"
    page.should have_content thing.name
  end

  scenario "can be created" do
    visit "/things/new"
    fill_in "Name", with: "new thing"
    click_button "Create Thing"
    Thing.count.should == 1
    Thing.last.name.should == "new thing"
  end

  scenario "can be modified" do
    thing = Fabricate(:thing)
    visit "/things/#{thing.id.to_s}/edit"
    fill_in "Name", with: "updated thing"
    click_button "Update Thing"
    thing.reload.name.should == "updated thing"
  end

  scenario "can be destroyed" do
    thing = Fabricate(:thing)
    visit "/things"
    page.evaluate_script('window.confirm = function() { return true; }')
    click_link "Destroy"
    Thing.count.should == 0
  end

  scenario "can not be found" do
    visit "/things/1"
    page.should have_content 'not found'
  end

end

