class AdminLikesController < ApplicationController
  before_action :set_post
  def create
    current_admin.admin_likes.create!(topic_id: params[:topic_id])
  end
  def destroy
    current_admin.admin_likes.find_by(topic_id: params[:topic_id]).destroy!
  end

  private

  def set_post
    @like = Topic.find(params[:topic_id])
  end
end
