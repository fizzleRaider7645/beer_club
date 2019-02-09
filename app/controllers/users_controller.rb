class UsersController < ApplicationController

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to :home
    end
  end
end
