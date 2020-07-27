class HomesController < ApplicationController
  def index
    @topics = Topic.all
    @shops = Shop.all
  end
end
