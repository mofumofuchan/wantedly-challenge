# -*- coding: utf-8 -8 *-
# TODO この処理はuses_controllerの中ですべき？

class SaidGoodPointsController < ApplicationController
  protect_from_forgery :except => [:create]

  def new
    @said_good_point = SaidGoodPoint.new
  end
  
  def create
    unless logged_in?
        redirect_to login_url and return
    end
    
    from = params[:from]
    to = params[:to]
    good_point = params[:good_point]
    # TODO createでなく, new&saveすれば，重複を検出処理を簡単に書けるはず
    SaidGoodPoint.create(from_id: from, to_id: to, good_point_id: good_point)
    redirect_to :back # TODO この使い方は変?
  end
end
