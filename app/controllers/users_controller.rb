class UsersController < ApplicationController
  def index

    if user_signed_in?
      @user = current_user
    elsif admin_signed_in?
      @admin = current_admin
      @user_shop = @admin.shop_id
      @shop = Shop.find_by(id: @user_shop)
      @topic = Topic.where(shop_id: @user_shop).order(id: :desc)
      @follow_count = FollowRelationship.where(admin_id: current_admin).count
    else
     redirect_to "/topics"
  end

  end
end
