class CartsController < ApplicationController
  before_action :set_cart, only: %i[destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def destroy
    @cart.destroy #if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your cart is now empty!' }
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
