class PubsController < ApplicationController
  def index
    @pubs = Topic.where(genre: "居酒屋").order(created_at: :desc).page(params[:page]).per(9)
  end
end
