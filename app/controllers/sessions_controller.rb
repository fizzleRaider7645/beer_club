class SessionsController < ApplicationController
  before_action :require_login
  
  def new
    @session = Session.new
  end

  def create
    @session = Session.find_by(id: params[:id])
    redirect_to :show
  end
end
