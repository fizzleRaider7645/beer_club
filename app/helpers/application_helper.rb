module ApplicationHelper
  def on_user_homepage?
    params["controller"] == "users" && params["action"] == "show"
  end
end
