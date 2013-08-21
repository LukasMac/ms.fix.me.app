require 'spec_helper'

describe "administration/pages/show.html.erb" do
  it "displays the page" do
  	@page = stub_model(Page, title: "Page title", body: "Page body", is_front_page: false)

  	render
  	rendered.should have_content("Page title")
    rendered.should have_content("Page body")
    rendered.should have_content("false")
  end
end
