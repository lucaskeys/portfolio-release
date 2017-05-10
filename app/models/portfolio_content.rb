class PortfolioContent < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
	#this lets you set up an array of attributes - lets you send a collection of items associated with a parent model

	include Placeholder
	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioContentUploader
	mount_uploader :main_image, PortfolioContentUploader

	def self.angular
		where(subtitle: "Angular")
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }

	# after_initialize :set_defaults
	#after a portfolio item has been intialized

end
