class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    binding.pry
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :item_text, :category_id, :price).merge(user_id: current_user.id)
  end
end
