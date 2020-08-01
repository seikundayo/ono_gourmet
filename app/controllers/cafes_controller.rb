class CafesController < ApplicationController
  def index
    @cafes = Topic.where(genre: "カフェ").page(params[:page]).per(9)
  end
end
