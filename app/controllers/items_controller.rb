class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def show
    @item = Item.all
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :price).merge(user_id: current_user.id)
  end
end
