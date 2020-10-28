class FollowListsController < ApplicationController
  def index
    if user_signed_in?
      @follow_lists = current_user.follow_shops
    else
      redirect_to topics_path
    end
  end
end
