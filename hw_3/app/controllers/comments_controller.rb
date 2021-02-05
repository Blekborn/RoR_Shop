class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, only: %i[destroy edit update comment_owner]
  before_action :comment_owner, only: %i[destroy edit update]
  before_action :authenticate_user!, except: %i[create destroy update]

  def new; end

  def edit
    @comment = @product.comments.find(params[:id])
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def create
    @comment = @product.comments.build(comment_params)
    unless @comment.save
      flash[:notice] = 'You\'ve already made a comment!'
    end
    redirect_to product_path(@product)
  end

  def update
    if @comment.update(comment_params)
      redirect_to product_path(@product), notice: 'successfully updated.'
    else
      redirect_to product_path(@product)
    end
  end

  def destroy
    @comment.destroy
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :rating, :product_id).merge({ user_id: current_user.id })
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = 'Not your comment'
      redirect_to @product
    end
  end
end
