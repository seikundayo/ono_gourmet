class LunchesController < ApplicationController
  def index
    @topics = Topic.where(genre: "ランチ").order(created_at: :desc).page(params[:page]).per(12)
  end
end
