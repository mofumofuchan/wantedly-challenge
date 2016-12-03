# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.includes(:found_good_points).
      find(params[:id])
    @good_points = @user.found_good_points
    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # TODO ここでログイン成功の表示
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
                                   :password, :password_confirmation)
    end

    
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
end
