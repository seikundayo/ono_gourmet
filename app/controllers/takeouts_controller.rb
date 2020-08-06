class TakeoutsController < ApplicationController
  def index
    @takeouts = Topic.where(genre: "テイクアウト").order(created_at: :desc).page(params[:page]).per(9)
  end
end
