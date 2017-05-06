module ApplicationHelper
	def login_helper style = ''
		# this fixes the bug of not passing in an arugment - ' is a default argument'
	   if current_user.is_a?(GuestUser) 
	   		(link_to "Sign Up", new_user_registration_path, class: style) + " ".html_safe +
	   		(link_to "Login", new_user_session_path, class: style) 	   		
	   else 
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
	   end 
	end

	def sample_helper 
		content_tag(:div, "My content", class: "my-class")
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{sessions[:source]} and you are on the #{layout_name} layout"
			content_tag(:p, greeting, class: "source-greeting")
		end
	end


	def set_copyright
	 	@copyright =  "&copy; #{Time.now.year} | <b>Luke Keysboe</b> All rights reservied".html_safe
	end
end
