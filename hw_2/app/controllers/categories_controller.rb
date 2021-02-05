class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  include CurrentCart
  before_action :set_cart
  helper_method :sort_column, :sort_direction


  def index
    @categories = Category.all

  end

  def show
    # @products = @category.products
    @products = Product.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 6)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Create category'
    else
      flash[:danger] = 'Dont create category'
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path,  success: 'Update category'
    else
      flash[:danger] = 'Dont update category'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
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