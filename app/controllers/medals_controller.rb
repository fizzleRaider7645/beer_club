class MedalsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    @medals = user.medals
  end

end
