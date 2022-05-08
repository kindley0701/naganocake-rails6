class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @sum = 0
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_number] == "1"
      @order.zip = current_customer.zip
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      @order.zip = Address.find(params[:order][:address_id]).zip
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:address_number] == "3"
      @address = Address.new
      @address.zip = Order.new(order_params).zip
      @address.address = Order.new(order_params).address
      @address.name = Order.new(order_params).name
    else
      redirect_to new_order_path
    end
  end

  def create
    order = Order.new(order_params)
    address = Address.new(address_params)
    cart_items = current_customer.cart_items
    order.save
    address.save
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    cart_items.destroy_all
    redirect_to complete_order_path
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:zip, :address, :name, :postage, :total, :pay_method)
  end
  
  def address_params
    params.require(:order).permit(:zip, :address, :name)
  end


end
