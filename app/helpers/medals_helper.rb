module MedalsHelper
  def index_title
    if params.include? :user_id
      "Your Medals, #{current_user.username}"
    else
      "All Medals"
    end
  end
end
