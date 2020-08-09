class BreadsController < ApplicationController
  def index
    @topics = Topic.where(genre: "パン").order(created_at: :desc).page(params[:page]).per(9)
  end
end
