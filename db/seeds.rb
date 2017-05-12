User.create!(
	email: "test@example.com",
	password: ""
)

3.times do |topic|
	Topic.create!(title: "Topic #{topic}")
end


10.times do |blog|      

	Blog.create!(title: "My Blog Post #{blog}", body: "8-bit tousled mustache,
	sriracha air plant snackwave hot chicken hashtag pickled. Franzen slow-carb organic chia post-
	ironic. Poke 8-bit bicycle rights squid green juice banjo, sriracha pabst VHS kinfolk. Fap migas
	tofu typewriter offal bushwick. Raw denim farm-to-table fam wolf, fap vape plaid craft beer VHS
	normcore fixie. Chillwave man braid microdosing woke, biodiesel fingerstache ugh la croix kitsch
	shoreditch farm-to-table cronut organic. Fam vegan swag small batch.", topic_id: Topic.last.id)
end

puts "10 blog posts creared"

5.times do |skill|
	Skill.create!(title: "Rails #{skill}", percent_utilized: 15)
end

puts "5 skills created"

1.times do |portfolio_item|
	PortfolioContent.create!(title: "Portfolio Title #{portfolio_item}", subtitle: "Angular", body: "Raw denim farm-to-table fam wolf, fap vape plaid craft beer VHS
	normcore fixie", main_image: "http://placehold.it/600x400", thumb_image: "http://placehold.it/350x200")
end

8.times do |portfolio_item|
	PortfolioContent.create!(title: "Portfolio Title #{portfolio_item}", subtitle: "Ruby on Rails", body: "Raw denim farm-to-table fam wolf, fap vape plaid craft beer VHS
	normcore fixie", main_image: "http://placehold.it/600x400", thumb_image: "http://placehold.it/350x200")
end


puts "9 portfolio items created"

3.times do |technology|
	PortfolioContent.last.technologies.create!(name: "Technology #{technology}")
end

puts "3 technologies created"