module ApplicationHelper
	# Render Customized Navbar for authenticated
	def load_nav
		if !current_user.nil?
	      (render partial: 'user_nav').html_safe
	    else
	      (render partial: 'login_nav').html_safe
	    end
	end


	def notice_display
		if notice
			return (content_tag( :p, notice, class: 'alert alert-dark text-center')).html_safe 
		else
			return
		end
	end

	def alert_display
		if alert
			return (content_tag( :p, alert, class: 'alert alert-dark text-center')).html_safe 
		else
			return
		end
	end
end
