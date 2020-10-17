class PubsController < ApplicationController
  def index
    @topics = Topic.where(genre: "居酒屋").order(created_at: :desc).page(params[:page]).per(12)
  end
end
