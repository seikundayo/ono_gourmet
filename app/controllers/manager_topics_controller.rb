class ManagerTopicsController < ApplicationController
  def index
    @manager_topics = ManagerTopic.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @manager_topic = ManagerTopic.find(params[:id])
    @topics = Topic.all.order(impressions_count: 'DESC').limit(5)
  end

  def new
    if user_signed_in? && current_user.admin == true
      @topic = ManagerTopic.new
      @admins = Admin.all.order(id: :asc)
      @shops = Shop.all.order(id: :asc)
    else
      @manager_topics = ManagerTopic.all.order(created_at: :desc).page(params[:page]).per(9)
      render action: :index
    end
  end

  def edit
    @topic = ManagerTopic.find(params[:id])
    @admins = Admin.all.order(id: :asc)
    @shops = Shop.all.order(id: :asc)
  end

  def destroy
    @topic = ManagerTopic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to manager_topics_url, notice: '記事を削除しました。' }
      format.json { head :no_content }
    end
  end

  def update
      @topic = ManagerTopic.find(params[:id])
      @admins = Admin.all
      @shops = Shop.all
      respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: '記事を更新しました。' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @topic = ManagerTopic.new(topic_params)
    @admins = Admin.all
    @shops = Shop.all
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: '記事を投稿しました。' }
        format.json { render :show, status: :created, location: @topic}
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def topic_params
      params.require(:manager_topic).permit(:title, :content, :word, :shop_id, :admin_id)
    end


end
