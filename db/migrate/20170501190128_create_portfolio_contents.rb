class CreatePortfolioContents < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_contents do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
