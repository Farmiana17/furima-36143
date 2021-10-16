class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    #@user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private

  def move_to_index
    #@user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

end