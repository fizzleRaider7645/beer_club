class MedalsController < ApplicationController
  skip_before_action :is_current_user?, only: [:index, :show]

  def index
    user_index if params.include? :user_id
    general_index if !params.include? :user_id
  end


  private

  def user_index
    user = User.find_by(id: params[:user_id])
    @medals = user.medals
  end

  def general_index
    @medals = Medal.all
  end

end
