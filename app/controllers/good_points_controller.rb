class GoodPointsController < ApplicationController
  def create
    GoodPoint.create(name: params[:name])
  end

  def index
  end
end
