require 'spec_helper'

describe "administration/pages/index.html.erb" do
  it "displays pages list" do
		@pages = [stub_model(Page, title: "Page title")]

		render
		rendered.should have_content("Page title")
  end

  it "displays new page link" do
		@pages = []

		render
		rendered.should have_link('New Page', :href => new_administration_page_path)
  end
end
