class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    if request.path == '/users/show'
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def update
    @user.update(user_params)
  end

end