class PortfolioContentsController < ApplicationController
	def index
		@portfolio_items = PortfolioContent.all
	end

end
