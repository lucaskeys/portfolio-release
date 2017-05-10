class PortfolioContentsController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

	layout 'portfolio'

	def index
		@portfolio_items = PortfolioContent.by_position
		# @portfolio_items = PortfolioContent.where(subtitle: "Ruby on Rails")
		# @portfolio_items = PortfolioContent.angular
		# @portfolio_items = PortfolioContent.ruby_on_rails_portfolio_items
	end

	def sort 
		params[:order].each do |key, value|
			PortfolioContent.find(value[:id]).update(position: value[:position])
		end

		render nothing: true
		# bypasses regular process of looking for a view - says action is finished and does not need to render view
	end

	def angular
		@angular_portfolio_items = PortfolioContent.angular
	end

	def show 
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
	end

	 def update
	
    	respond_to do |format|
      	if @portfolio_item.update(portfolio_content_params)
        format.html { redirect_to portfolio_contents_path, notice: 'Blog was successfully updated.' }
      	else
        format.html { render :edit }
    	end
      end
    end

  	def destroy
	
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

	def set_portfolio_item
		@portfolio_item = PortfolioContent.find(params[:id])
	end
end
