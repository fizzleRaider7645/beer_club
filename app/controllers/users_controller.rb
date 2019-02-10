class UsersController < ApplicationController
  before_action :require_login
  # skip_before_action :require_login, only: [:index]

  def show
    @user = current_user
  end
end
