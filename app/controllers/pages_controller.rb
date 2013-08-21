class PagesController < ShopController
	def show
		@page = Page.find(params[:url_segment])
	end
end
