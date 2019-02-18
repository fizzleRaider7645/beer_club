module ApplicationHelper
  def on_user_homepage?
    params["controller"] == "users" && params["action"] == "show"
  end

  def logged_out?
    params["controller"] == "sessions" && params["action"] == "home"
  end
end
