class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      Item.includes(:users)
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday).merge(user_id: current_user.id)
  end

end
