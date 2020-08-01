class DinnersController < ApplicationController
  def index
    @dinners = Topic.where(genre: "ディナー").page(params[:page]).per(9)
  end
end
