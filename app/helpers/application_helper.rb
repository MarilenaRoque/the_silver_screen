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
    content_tag(:p, notice, class: 'alert alert-dark text-center').html_safe if notice
  end

  def alert_display
    content_tag(:p, alert, class: 'alert alert-dark text-center').html_safe if alert
  end
end
