class PortfolioContentsController < ApplicationController
	def index
		@portfolio_items = PortfolioContent.all
		# @portfolio_items = PortfolioContent.where(subtitle: "Ruby on Rails")
		# @portfolio_items = PortfolioContent.angular
		# @portfolio_items = PortfolioContent.ruby_on_rails_portfolio_items
	end

	def angular
		@angular_portfolio_items = PortfolioContent.angular
	end

	def show 
		@portfolio_item = PortfolioContent.find(params[:id])
	end

	def new
		@portfolio_item = PortfolioContent.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = PortfolioContent.new(portfolio_content_params)

		respond_to do |format|
		if @portfolio_item.save
			format.html { redirect_to portfolio_contents_path, notice: "Your item is now live" }
		else
			format.html { render :new}
		end
		end
	end

	def edit
		@portfolio_item = PortfolioContent.find(params[:id])
	end

	 def update
	  	@portfolio_item = PortfolioContent.find(params[:id])
    	respond_to do |format|
      	if @portfolio_item.update(portfolio_content_params)
        format.html { redirect_to portfolio_contents_path, notice: 'Blog was successfully updated.' }
      	else
        format.html { render :edit }
    	end
      end
    end

  	def destroy
	  	@portfolio_item = PortfolioContent.find(params[:id])
	  	@portfolio_item.destroy
  			respond_to do |format|
  			format.html { redirect_to portfolio_contents_url, notice: "Record was removed"}
    	end
	end

	private 
	def portfolio_content_params
		params.require(:portfolio_content).permit(:title, 
												  :subtitle, 
												  :body, 
												  technologies_attributes: [:name]
												  )
		
	end
end
