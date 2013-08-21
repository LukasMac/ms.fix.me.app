require 'spec_helper'
 
describe "products/show.html.erb" do
	fixtures :products, :variants

	SAMPLE_IMAGE_FILENAME = 'sample_image.png'
	MISSING_IMAGE_FILENAME = 'missing.png'

	it "displays the product variants prices" do
		@product = products(:product_with_variants)

		render
		rendered.should have_content("100")
		rendered.should have_content("200")
	end

	it "displays the product image" do
		@product = products(:product_with_image)

		render
		rendered.should have_css("img[src*='#{SAMPLE_IMAGE_FILENAME}']")
	end

	it "display missing image when product image is empty" do
		@product = products(:product_no_image)

		render
		rendered.should have_css("img[src*='#{MISSING_IMAGE_FILENAME}']")
	end
end