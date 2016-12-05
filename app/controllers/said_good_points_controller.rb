# -*- coding: utf-8 *-
class SaidGoodPointsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    
    # debugger

    unless logged_in?
        redirect_to login_url and return
    end
    
    from = params[:from]
    to = params[:to]
    good_point = params[:good_point]
    SaidGoodPoint.create(from_id: from, to_id: to, good_point_id: good_point)
    redirect_to :back 
  end
end
