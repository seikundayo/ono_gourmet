class TopicsController < ApplicationController
   impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    @search = Topic.ransack(params[:q])
    @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all.order(impressions_count: 'DESC').limit(5)
    impressionist(@topic, nil, unique: [:impressionable_id, :ip_address])
  end
end
