class CouponsController < ApplicationController
  def index
    @topics = Topic.where(genre: "クーポン").order(created_at: :desc).page(params[:page]).per(12)
  end
end
