class ShopsController < ApplicationController
  def index
    @search = Shop.ransack(params[:q])
    @shops = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
  end

  def show
    @shops_contents = Topic.where(shop_id: params[:id])
    @shops_name = Topic.find_by(shop_id: params[:id])
  end

  def new
    if user_signed_in? && current_user.id == 1
      @shop = Shop.new
    else
      @search = Shop.ransack(params[:q])
      @shops = @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(9)
      render action: :index
    end
  end

  def edit
    @shop = Shop.find(params[:id])
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
        format.html { redirect_to @shop, notice: 'Post was successfully updated.' }
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
