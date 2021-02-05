class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]
  include CurrentCart
  before_action :set_cart
  helper_method :sort_column, :sort_direction

  def index
    @categories = Category.all
  end

  def show
    @products = Product.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 6)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id )
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end