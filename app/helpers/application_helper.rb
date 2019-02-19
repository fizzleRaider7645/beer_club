module ApplicationHelper
  def on_user_homepage?
    params["controller"] == "users" && params["action"] == "show"
  end

  def logging_in?
    params["controller"] == "sessions" && params["action"] == "login"
  end

  def logged_out?
    params["controller"] == "sessions" && params["action"] == "home"
  end

  def do_not_render
    on_user_homepage? || logging_in? || logged_out?
  end
end
