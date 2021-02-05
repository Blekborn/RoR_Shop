class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[new create]

  def new
    if @cart.line_items.empty?
      redirect_to root_path, notice: 'Your cart is empty'
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        OrderMailer.with(order: @order).new_order_email.deliver_now

        format.html { redirect_to root_url, notice: 'Thank you for your order.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        # @cart = current_cart
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def order_params
    params.require(:order).permit(:name, :address, :email, :pay_type)
  end
end
