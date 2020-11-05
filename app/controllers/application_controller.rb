class ApplicationController < ActionController::Base
  before_action :set_instance_user
  before_action :set_instance_admin
  before_action :set_instance_follow_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_location

protected

def configure_permitted_parameters
  # sign_upのときに、nameをストロングパラメータに追加する
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :user_image, :birthday, :sex, :shop_id, :admin_name, :admin_image])
  # account_updateのときに、nameをストロングパラメータに追加する
  devise_parameter_sanitizer.permit(:account_update, keys: [:username, :user_image, :birthday, :sex, :shop_id, :admin_name, :admin_image])
end

def store_location
  if (request.fullpath != "/users/sign_in" &&
      request.fullpath != "/users/sign_up" &&
      request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
  end
end

  def set_instance_user
    if user_signed_in?
      @liked_topic_ids = current_user.likes.pluck(:topic_id)
    else
      @liked_topic_ids = Like.where(user_id: 0)
    end
  end

  def set_instance_admin
    if admin_signed_in?
      @admin_liked_topic_ids = current_admin.admin_likes.pluck(:topic_id)
    else
      @admin_liked_topic_ids = Like.where(user_id: 0)
    end
  end

  def set_instance_follow_user
    if user_signed_in?
      @user_follow_relationships_admin_ids = current_user.follow_relationships.pluck(:admin_id)
    else
      @user_follow_relationships_admin_ids = FollowRelationship.where(admin_id: 0)
    end
  end

end
