class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      binding.pry
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping)
          .permit(:post_number, :prefecture_id, :city, 
                  :address, :building, :phone)
          .merge(user_id: current_user.id, item_id: @item.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? == false || @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end