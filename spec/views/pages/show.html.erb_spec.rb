require 'spec_helper'
 
describe "pages/show.html.erb" do
	it "displays the full page" do
		@page = stub_model(Page, title: "Page title", body: "Page body", is_front_page: true)

		render
		rendered.should have_content("Page title")
		rendered.should have_content("Page body")
	end
end