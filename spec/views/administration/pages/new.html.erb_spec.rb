require 'spec_helper'

describe "administration/pages/new.html.erb" do
  it "displays new page form" do
  	@page = stub_model(Page).as_null_object

  	render
  	rendered.should have_selector("form")

  	rendered.should have_field('page[title]')
  	rendered.should have_field('page[body]')
  	rendered.should have_field('page[is_front_page]')

    rendered.should have_selector('input[type=submit]')
  end
end
