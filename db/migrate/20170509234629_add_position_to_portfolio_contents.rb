class AddPositionToPortfolioContents < ActiveRecord::Migration[5.0]
  def change
  	add_column :portfolio_contents, :position, :integer
  end
end
