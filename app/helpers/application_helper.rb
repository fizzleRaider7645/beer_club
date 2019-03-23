module ApplicationHelper

  def do_not_render
    # on_user_homepage? || logging_in? || logging_out? || on_create_new_user?
    !current_user
  end

  def on_user_homepage?
    params["controller"] == "users" && params["action"] == "show"
  end

  def logging_in?
    params["controller"] == "sessions" && params["action"] == "login"
  end

  def logging_out?
    params["controller"] == "sessions" && params["action"] == "home"
  end

  def on_create_new_user?
    params["controller"] == "users" && params["action"] == "new"
  end
end
