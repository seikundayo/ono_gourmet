class ShopsController < ApplicationController
  def index
    @shops = Shop.all.page(params[:page]).order(created_at: :desc).per(9)
  end
  def show
    @shops_contents = Topic.where(shop_id: params[:id])
    @shops_name = Topic.find_by(shop_id: params[:id])
  end
end
