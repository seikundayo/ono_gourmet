class BreadsController < ApplicationController
  def index
    @breads = Topic.where(genre: "パン").page(params[:page]).per(9)
  end
end
