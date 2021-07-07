class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to item_path(@comment.item.id)
  end

  def edit
  end

  def update
    comment = Comment.find(params[:id])
    @comment.update(comment_params)
    #redirect_to user_path(current_user.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to item_path(comment.item.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
