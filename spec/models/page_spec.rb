require 'spec_helper'

describe Page do
	fixtures :pages

	it "returns all front pages" do
		Page.front_pages.each do |page|
			page.is_front_page.should be_true
		end
	end

	it "returns all content pages" do
		Page.content_pages.each do |page|
			page.is_front_page.should_not be_true
		end
	end
end
