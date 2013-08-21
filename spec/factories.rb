# FactoryGirl.define do
# 	factory :product, class: Product do
# 		factory :with_variants do
# 			variants << FactoryGirl.create(:variant)
# 		end
# 	end

# 	factory :variant, class: Variant do
# 		after :create, :build do |variant|
# 	    variant.stub(:stock_level_available).and_return(0)
# 	  end
# 	end
# end