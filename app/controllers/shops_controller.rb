class ShopsController < ApplicationController
  def index

    @search = Shop.ransack(params[:q])
    @shops = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)

  end
  def show
    @shops_contents = Topic.where(shop_id: params[:id])
    @shops_name = Topic.find_by(shop_id: params[:id])
  end
end
