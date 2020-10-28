class FollowRelationshipsController < ApplicationController
  before_action :set_post
  def create
    admin = Admin.find_by(shop_id: params[:shop_id])
    current_user.follow_relationships.create!(admin_id: admin.id)
  end
  def destroy
    admin = Admin.find_by(shop_id: params[:shop_id])
    current_user.follow_relationships.find_by(admin_id: admin.id).destroy!
  end

  private

  def set_post
    @admin = Admin.find_by(shop_id: params[:shop_id])
  end

end
