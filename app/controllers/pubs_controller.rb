class PubsController < ApplicationController
  def index
    @pubs = Topic.where(genre: "居酒屋").page(params[:page]).per(9)
  end
end
