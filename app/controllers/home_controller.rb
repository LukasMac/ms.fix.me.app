class HomeController < ShopController

	def home
		@pages = Page.front_pages
	end

end