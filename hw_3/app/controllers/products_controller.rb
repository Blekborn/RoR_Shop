class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  helper_method :sort_column, :sort_direction
  before_action :force_json, only: :search
  include CurrentCart
  before_action :set_cart


  def index
    @products = Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 6)
    @products = Product.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 6)

    @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
  end

  def show
    @comments = @product.comments
  end

  def search
    @products = Product.ransack(title_cont: params[:q]).result(distinct: true)
    respond_to do |format|
      format.html {}
      format.json {
        @products = @products.limit(5)
      }
    end
  end

  # def search
  #   q = params[:q].downcase
  #   @product = Product.where('title LIKE ?', "%#{q}%").paginate(page: params[:page], per_page: 3)
  # end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image, :price, :category_id)
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def force_json
    request.format = :json
  end
end
