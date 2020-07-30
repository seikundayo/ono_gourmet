class HomesController < ApplicationController
  def index
    @topics = Topic.all.page(params[:page]).per(9)
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
