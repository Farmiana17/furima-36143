class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    #@user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
  end

  def create
    #@order = Order.new(order_params)
    #@shipping = Shipping.new(shipping_params)
    #if @shipping.save
      #redirect_to root_path
    #else
      #render :index
    #end
  end

  private

  #def shipping_params
    #params.require(:shipping)
          #.permit(:post_number, :prefecture_id, :city, 
                  #:address, :building, :phone)
  #end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? == false || @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end