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
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping)
          .permit(:post_number, :prefecture_id, :city, :address, :building, :phone)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(amount: @item.price, card: purchase_params[:token], currency: 'jpy')
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? == false || @item.user.id == current_user.id
      redirect_to root_path
    end
  end

end