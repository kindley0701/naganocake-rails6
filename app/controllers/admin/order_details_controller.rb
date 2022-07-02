class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    if @order_detail.update(order_detail_params)
      @order.update(status: 2) if @order_detail.making_status == "creating"
      @order.update(status: 3) if @order_details.distinct.pluck(:making_status) == ["completed"]
      redirect_to admin_order_path(@order_detail.order_id)
    else
      @order = Order.find(params[:id])
      render template: "admin/orders/show"
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
