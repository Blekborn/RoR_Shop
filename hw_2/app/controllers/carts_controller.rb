class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def destroy; end

  def edit; end

  def show; end

  def update; end

  def destroy
    @cart.destroy #if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Invalid cart'
  end
end
