class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

      if @order.status == "入金確認"
        @order_details.each do |order_detail|
          order_detail.make_status = "製作待ち"
          order_detail.save
        end
      end
      redirect_to admin_order_path
  end

  def order_detail_update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order)
  end

  def order_params
    params.require(:order).permit(:postal_code, :customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status, :item_id, :order_id)
  end

end
