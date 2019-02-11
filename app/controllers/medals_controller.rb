class MedalsController < ApplicationController

  def index
    if !params.include? :user_id
      @medals = Medal.all
    else
      @user = User.find_by(id: params[:user_id])
      @medals = @user.medals
    end
  end
end
