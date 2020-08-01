class LunchesController < ApplicationController
  def index
    @lunches = Topic.where(genre: "ランチ").page(params[:page]).per(9)
  end
end
