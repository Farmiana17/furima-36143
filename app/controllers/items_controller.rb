class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:image, :item_name, :item_detail, :price, :category_id, 
                  :item_state_id, :delivery_fee_id, :prefecture_id, :spend_day_id)
          .merge(user_id: current_user.id)
  end

end
