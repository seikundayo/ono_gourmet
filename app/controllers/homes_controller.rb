class HomesController < ApplicationController
  def index
    @search = Topic.ransack(params[:q])
    @topics = @search.result(distinct: true).page(params[:page]).per(9)
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
