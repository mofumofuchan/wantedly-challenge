# -*- coding: utf-8 -*-
class GoodPointsController < ApplicationController
  def create
    unless logged_in?
      redirect_to login_url and return
    end
    
    good_point = GoodPoint.new(name: params[:name])
    if good_point.save
      redirect_to :back # TODO redirectを使うべき場面でないきがする
    else
      # エラー表示
      redirect_to :back # TODO redirectを使うべき場面ではない？
    end
  end

  # いいところの一覧を表示
  def index
  end
end
