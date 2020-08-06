class CafesController < ApplicationController
  def index
    @cafes = Topic.where(genre: "カフェ").order(created_at: :desc).page(params[:page]).per(9)
  end
end
