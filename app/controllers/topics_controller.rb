class TopicsController < ApplicationController
   impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    # @search = Topic.ransack(params[:q])
    # @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(12)
    if params[:genre] === "カフェ"
      @topics = Topic.where(genre: "カフェ").order(created_at: :desc).page(params[:page]).per(12)
      @tab_cafe = "cafe"
    elsif params[:genre] === "ランチ"
      @topics = Topic.where(genre: "ランチ").order(created_at: :desc).page(params[:page]).per(12)
      @tab_lunch = "lunch"
    elsif params[:genre] === "ディナー"
      @topics = Topic.where(genre: "ディナー").order(created_at: :desc).page(params[:page]).per(12)
      @tab_dinner = "dinner"
    elsif params[:genre] === "パン"
      @topics = Topic.where(genre: "パン").order(created_at: :desc).page(params[:page]).per(12)
      @tab_bread = "bread"
    elsif params[:genre] === "居酒屋"
      @topics = Topic.where(genre: "居酒屋").order(created_at: :desc).page(params[:page]).per(12)
      @tab_pub = "pub"
    elsif params[:genre] === "テイクアウト"
      @topics = Topic.where(genre: "テイクアウト").order(created_at: :desc).page(params[:page]).per(12)
      @tab_takeout = "takeout"
    else
      @topics = Topic.where.not(genre: "クーポン").order(created_at: :desc).page(params[:page]).per(12)
      @tab = "top"
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all.order(impressions_count: 'DESC').limit(5)
    impressionist(@topic, nil, unique: [:impressionable_id, :ip_address])
  end

  def new
    if admin_signed_in? || user_signed_in?
        @topic = Topic.new
        @shops = Shop.all.order(id: :asc)
      if admin_signed_in?
        @user = current_admin
        @user_shop = @user.shop_id
      end
    else
      @search = Topic.ransack(params[:q])
      @topics = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(12)
      render action: :index
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @shops = Shop.all
    if admin_signed_in?
      @user = current_admin
      @user_shop = @user.shop_id
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: '記事を削除しました。' }
      format.json { head :no_content }
    end
  end

  def update
      @topic = Topic.find(params[:id])
      @shops = Shop.all
      respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to "/", notice: '記事を更新しました。' }
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
    if admin_signed_in?
      @user = current_admin
      @user_shop = @user.shop_id
      @topic.shop_id == @user_shop
    end
        respond_to do |format|
        if @topic.save
          format.html { redirect_to "/", notice: '記事を投稿しました。' }
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
