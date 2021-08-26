# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = if request.path == '/users/show'
              current_user
            else
              User.find(params[:id])
            end
  end
end
