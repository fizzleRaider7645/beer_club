class BeersController < ApplicationController
  skip_before_action :is_current_user?, only: [:index, :show]

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find_by(id: params[:id])
  end
end
