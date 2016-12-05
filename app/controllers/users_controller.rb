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
    @shown_user = @user

    # TODO 生のSQLではなく，ActiveRecordを使って書き直す
    query =<<EOS
SELECT good_points.id, good_points.name, COUNT(good_points.name) AS count_good_points_name
FROM said_good_points
INNER JOIN good_points ON good_points.id = said_good_points.good_point_id
WHERE said_good_points.to_id = %d
GROUP BY good_points.name
ORDER BY count_good_points_name DESC;
EOS
    @good_points = ActiveRecord::Base.connection.
      select_all(query % @user.id).rows

    # 既にcurrent_userが投票済みのいいところを取得
    @yet_found_good_points =  SaidGoodPoint.where from_id: current_user.id ,to_id: @user.id
    # @good_point = GoodPoint
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

  def good_point
    good_point = GoodPoint.new(name: params[:name])
    unless good_point.save
      # エラー処理
      return
    end

    # いいところが追加されたページのユーザ番号を取得 TODO もっとまともな方法があるはずor設計の見直し
    to_id = params[:shown_user_id].scan(/=>(\d+)/).flatten[0].to_i

    # debugger
    
    said_good_point = SaidGoodPoint.new(from_id: current_user.id, to_id: to_id,
                                        good_point_id: good_point.id)
    unless said_good_point.save
      # エラー処理
    end

    redirect_to :back # TODO この書き方は変
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
