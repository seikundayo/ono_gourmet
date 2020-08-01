class TakeoutsController < ApplicationController
  def index
    @takeouts = Topic.where(genre: "テイクアウト").page(params[:page]).per(9)
  end
end
