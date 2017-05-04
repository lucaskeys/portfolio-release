module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_filter :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Portfolio | Luke keysboe"
		@seo_keywords = "Luke Keysboe Portfolio Web developer Rails Ruby backend frontend programming software scout"
	end
end