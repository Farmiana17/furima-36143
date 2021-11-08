class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
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

  def edit
    redirect_to root_path if @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:image, :item_name, :item_detail, :price, :category_id,
                  :item_state_id, :delivery_fee_id, :prefecture_id, :spend_day_id)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless item.user.id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
