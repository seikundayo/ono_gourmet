class LunchesController < ApplicationController
  def index
    @topics = Topic.where(genre: "ランチ").order(created_at: :desc).page(params[:page]).per(9)
  end
end
