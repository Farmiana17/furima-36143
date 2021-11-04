class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    #@order = Order.new
    @purchase_shipping = PurchaseShipping.new
  end

  def new
  end

  def create
    #@order = Order.new(order_params)
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      #@purchase_shipping.save
      #@order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  #def order_params
    #@order = Order.new
    #params.require(:order).permit(:id, :price)
  #end

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