class TopicsController < ApplicationController
   impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    @search = Topic.ransack(params[:q])
    @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all.order(impressions_count: 'DESC').limit(5)
    impressionist(@topic, nil, unique: [:impressionable_id, :ip_address])
  end

  def new
    if user_signed_in? && current_user.admin == true
        @topic = Topic.new
        @shops = Shop.all
      if current_user.pro_id > 0
        @user = current_user
        @user_shop = @user.pro_id
      end
    else
      @search = Topic.ransack(params[:q])
      @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
      render action: :index
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @shops = Shop.all
    if current_user.pro_id > 0
      @user = current_user
      @user_shop = @user.pro_id
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
      @topic = Topic.find(params[:id])
      @shops = Shop.all
      respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @topic = Topic.new(topic_params)
    @shops = Shop.all
    if current_user.pro_id > 0
      @user = current_user
      @user_shop = @user.pro_id
      @topic.shop_id == @user_shop
    end
        respond_to do |format|
        if @topic.save
          format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
          format.json { render :show, status: :created, location: @topic}
        else
          format.html { render :new }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end
      end
  end


  private

    def topic_params
      params.require(:topic).permit(:title, :genre, :content, :shop_id, :image)
    end

end
