class TakeoutsController < ApplicationController
  def index
    @topics = Topic.where(genre: "テイクアウト").order(created_at: :desc).page(params[:page]).per(12)
  end
end
