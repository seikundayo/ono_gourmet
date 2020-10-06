class ManagementsController < ApplicationController
 before_action :if_not_admin

  def index
    @topics = Topic.all.order(id: :desc)
    @manager_topics = ManagerTopic.all.order(id: :asc)
    @managers = Manager.all.order(id: :asc)
    @shops = Shop.all.order(id: :asc)
  end

  def if_not_admin
    redirect_to topics_path unless user_signed_in? && current_user.admin = true && current_user.id == 1
  end

end
