class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer

  end

  def index
    @orders = Order.all
  end

  def show
    current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #if @order.save!
      #@cart_items = current_customer.cart_items
      #@cart_items.each do |cart_item|
        #order_detail = OrderDetail.new(order_id: @order.id)
        #order_detail.price = cart_item.item.price
        #order_detail.amount = cart_item.amount
        #order_detail.item_id = cart_item.item_id
        #order_detail.save!
      #end
      #@cart_items.destroy_all
      #redirect_to public_orders_thanks_path
    #else
      #render "new"
    #end

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.total_payment = 0
    @order.payment_method = order_params[:payment_method]
    @cart_items.each do |cart_item|
      @order.total_payment += cart_item.item.add_tax_sales_price * cart_item.amount
    end
      @order.shipping_cost = 800
    if params[:selected_address] == "radio1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:selected_address] == "radio2"
      address = Address.find(params[:regestrated_address][:address])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)

  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
