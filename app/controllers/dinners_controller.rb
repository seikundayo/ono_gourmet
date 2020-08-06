class DinnersController < ApplicationController
  def index
    @dinners = Topic.where(genre: "ディナー").order(created_at: :desc).page(params[:page]).per(9)
  end
end
