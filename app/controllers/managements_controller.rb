class ManagementsController < ApplicationController
 before_action :if_not_admin

  def index
    @topics = Topic.all
    @manager_topics = ManagerTopic.all
    @managers = Manager.all
    @shops = Shop.all
  end

  def if_not_admin
    redirect_to topics_path unless user_signed_in? && current_user.id == 1
  end

end
