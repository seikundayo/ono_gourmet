class TopicsController < ApplicationController
   impressionist :actions => [:show,:index]

  def index
    @search = Topic.ransack(params[:q])
    @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @topic = Topic.find(params[:id])
    impressionist(@topic, nil, unique: [:session_hash])
  end
end
