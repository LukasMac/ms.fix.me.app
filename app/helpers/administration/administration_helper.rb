module Administration::AdministrationHelper

	def category_link(category)
		return '' unless category

		link_to(category.name, administration_category_path(category))
	end

	def published_status(i)
		ActsAsPublishable::STATUS_NAMES[i]
	end

	def publish_status_options
		options = Array.new()

		ActsAsPublishable::STATUS_NAMES.each_with_index do |item, index|
			options << [item.empty? ? "All" : item , index]
		end

		options
	end
end
