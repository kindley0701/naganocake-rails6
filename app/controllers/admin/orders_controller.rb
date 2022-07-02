class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "confirm" #なんで==1だと分岐してくれないの？
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
