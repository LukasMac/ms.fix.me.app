require 'spec_helper'

describe Product do
	fixtures :products, :variants

	it "returns title with containing variants price range" do
		products(:product_with_variants).title_with_price_range.should match(/100.+200/)
	end
end