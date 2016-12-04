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
    @user = User.find(params[:id])
    # TODO 生のSQLではなく，ActiveRecordを使って書き直す
    query =<<EOS
SELECT good_points.name, COUNT(good_points.name) AS count_good_points_name
FROM said_good_points
INNER JOIN good_points ON good_points.id = said_good_points.good_point_id
WHERE said_good_points.to_id = %d
GROUP BY good_points.name
ORDER BY count_good_points_name DESC;
EOS
    @good_points = ActiveRecord::Base.connection.
      select_all(query % @user.id).rows
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
