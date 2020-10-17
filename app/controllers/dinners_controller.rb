class DinnersController < ApplicationController
  def index
    @topics = Topic.where(genre: "ディナー").order(created_at: :desc).page(params[:page]).per(12)
  end
end
