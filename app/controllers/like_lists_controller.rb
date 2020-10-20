class LikeListsController < ApplicationController
  def index
    if user_signed_in?
      @like_lists = current_user.likes
    else
      redirect_to topics_path
    end
  end
end


# if user_signed_in?
#    @like_lists = current_user.likes
#  else
#    flash[:alert] = "「行ってみたいリスト」を表示するにはログインしてください"
#    redirect_to topics_path
#  end
