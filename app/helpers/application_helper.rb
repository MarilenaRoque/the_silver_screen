module ApplicationHelper
	# Render Customized Navbar for authenticated
	def load_nav
		if !current_user.nil?
	      (render partial: 'user_nav').html_safe
	    else
	      (render partial: 'login_nav').html_safe
	    end
	end
end
