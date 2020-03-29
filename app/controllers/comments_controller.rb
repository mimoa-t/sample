class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to product_path(comment.product.id)
    else
      redirect_to product_path(comment_params[:product_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      if comment.destroy
        redirect_to product_path(comment.product_id)
      else
        redirect_to product_path(comment.product_id)
      end
    end
  end

  private

  def comment_params
    params.permit(:comment, :product_id)
  end
end
