class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    #order.indexでアイテムの名前などを呼び出すため。例）@item.name
  end

  # private
  # def order_params
  #   params.require(:order).permit(:name, :category).merge(user_id: current_user.id, item_id: params[:item_id])
  # end
end