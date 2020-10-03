class ManagersController < ApplicationController
  def new
    if user_signed_in? && current_user.id == 1
      @manager = Manager.new
    else
      render template: "topics/index"
    end
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
      @manager = Manager.find(params[:id])
      respond_to do |format|
      if @manager.update(shop_params)
        format.html { redirect_to @manager, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @manager = Manager.new(manager_params)
    respond_to do |format|
      if @manager.save
        format.html { redirect_to controller: :topics, action: :index, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @manager}
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def manager_params
      params.require(:manager).permit(:manager_name, :manager_image)
    end

end
