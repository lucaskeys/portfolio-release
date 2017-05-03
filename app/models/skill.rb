class Skill < ApplicationRecord
	include Placeholder
	validates_presence_of :title, :percent_utilized

	after_initialize :set_defaults
#after a portfolio item has been intialized

	def set_defaults
		self.rank ||= Placeholder.image_generator(height: '250', width: '250')
	end
end
