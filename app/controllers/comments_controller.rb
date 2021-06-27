class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to root_path
  end

  def destroy
    Comment.find_by(id: params[:id], item_id: params[:item_id]).destroy
    redirect_to user_path(current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
