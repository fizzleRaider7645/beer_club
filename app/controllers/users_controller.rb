class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    raise params.inspect
  end
end
