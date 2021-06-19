class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def search
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :item_text, :category_id, :price).merge(user_id: current_user.id)
  end
end
