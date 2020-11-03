class ShopsController < ApplicationController
  def index
    # @search = Shop.ransack(params[:q])
    # @shops = @search.result(distinct: true).order("name").page(params[:page]).per(12)
    @admins = Admin.all.page(params[:page]).per(12)
  end

  def show
    @topics = Topic.where(shop_id: params[:id]).order(created_at: :desc).page(params[:page]).per(12)
    @shops_name = Shop.find(params[:id])
    @follow_count = FollowRelationship.where(admin_id: @shops_name.id).count
  end

  def new
    if user_signed_in? && current_user.id == 1
      @shop = Shop.new
    else
      # @search = Shop.ransack(params[:q])
      # @shops = @search.result(distinct: true).order("name").page(params[:page]).per(12)
      @admins = Admin.all.page(params[:page]).per(12)
      render action: :index
    end
  end

  def edit
    if user_signed_in? && current_user.admin == true
      @shop = Shop.find(params[:id])
    elsif admin_signed_in?
      @user = current_admin
      @user_shop = @user.shop_id
      @shop = Shop.find(@user_shop)
    else
      # @search = Shop.ransack(params[:q])
      # @shops = @search.result(distinct: true).order("name").page(params[:page]).per(12)
      @admins = Admin.all.page(params[:page]).per(12)
      render action: :index
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
      @shop = Shop.find(params[:id])
      respond_to do |format|
      if@shop.update(shop_params)
        format.html { redirect_to @shop, notice: '店舗情報を更新しました。' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @shop = Shop.new(shop_params)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @shop}
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def shop_params
      params.require(:shop).permit(:name, :number,:address,:access,:time,:rest,:takeout,:map,:introduce,:shop_image)
    end


end
