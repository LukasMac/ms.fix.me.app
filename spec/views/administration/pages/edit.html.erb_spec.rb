require 'spec_helper'

describe "administration/pages/edit.html.erb" do
  it "displays edit page form with values" do
  	@page = stub_model(Page, title: "Page title", body: "Page body", is_front_page: false).as_null_object

  	render
  	rendered.should have_selector("form")
  	rendered.should have_field('page[title]', :with => "Page title")
  	rendered.should have_field('page[body]', :text => 'Page body')
  	rendered.should have_field('page[is_front_page]', :checked => false)
  end
end
