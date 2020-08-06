class BreadsController < ApplicationController
  def index
    @breads = Topic.where(genre: "パン").order(created_at: :desc).page(params[:page]).per(9)
  end
end
