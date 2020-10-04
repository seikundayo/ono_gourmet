class ProUsersController < ApplicationController
  before_action :if_not_admin

  def index
    @user = current_user
    @user_shop = @user.pro_id
    @shop = Shop.find_by(id: @user_shop)
    @topic = Topic.where(shop_id: @user_shop)
  end

   def if_not_admin
     redirect_to topics_path unless current_user.pro_id > 0
   end

end
