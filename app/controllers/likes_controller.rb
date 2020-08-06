class LikesController < ApplicationController
  before_action :set_post
  def create
    if user_signed_in?
      current_user.likes.create!(topic_id: params[:topic_id])
    else
      flash[:alert] = "「いいね」をする場合はログインしてください"
      redirect_to topics_path
    end
  end

  def destroy
    current_user.likes.find_by(topic_id: params[:topic_id]).destroy!
  end

  private

  def set_post
    @like = Topic.find(params[:topic_id])
  end
end
