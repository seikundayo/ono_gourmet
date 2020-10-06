class ApplicationController < ActionController::Base
  before_action :set_instance

  def after_sign_in_path_for(resource)
    topics_path
  end

  def set_instance
    if user_signed_in?
      @liked_topic_ids = current_user.likes.pluck(:topic_id)
    else
      @liked_topic_ids = Like.where(user_id: 0)
    end
  end

end
