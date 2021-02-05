class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit show update destroy]
  helper_method :sort_column, :sort_direction
  before_action :force_json, only: :search
  include CurrentCart
  before_action :set_cart

  def index
    @products = if params[:q]
                  Product.search(params[:q]).order('created_at DESC').paginate(page: params[:page], per_page: 6)
                else
                  Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 6)
                end
    @products = Product.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 6)

    @products = @products.where('price >= ?', params[:min_price]) if params[:min_price].present?
    @products = @products.where('price <= ?', params[:max_price]) if params[:max_price].present?
  end

  def edit; end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    q = params[:q].downcase
    @product = Product.where('title LIKE ?', "%#{q}%").paginate(page: params[:page], per_page: 3)
  end


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
