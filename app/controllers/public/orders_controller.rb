class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = current_customer.orders.all
  end

  def index
  end

  def show
    current_customer
  end

  def create
    current_customer
  end

  def confirm
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)

  end

end
