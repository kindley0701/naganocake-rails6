class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    #@cart_items = current_customer.cart_itemsでもよき
    @sum = 0
    @order = Order.new(
      customer_id: current_customer.id,
      pay_method: params[:order][:pay_method]
      ) #order_paramsでやると余計なのが多いから別の書き方．右を左に代入する
    if params[:order][:address_number] == "1" && params[:order][:pay_method].in?(['transfer','credit_card'])
      @order.zip = current_customer.zip
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      render :confirm
    elsif params[:order][:address_number] == "2" && params[:order][:pay_method].in?(['transfer','credit_card'])
      @order.zip = Address.find(params[:order][:address_id]).zip
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
      render :confirm
    elsif params[:order][:address_number] == "3" && params[:order][:pay_method].in?(['transfer','credit_card'])
      @order.zip = Order.new(order_params).zip
      @order.address = Order.new(order_params).address
      @order.name = Order.new(order_params).name
      render :confirm
    else
      redirect_to new_order_path
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@order = current_customer.orders.new(order_params)　<=上2行をまとめて書けるよ．
    @cart_items = current_customer.cart_items
    if @order.save
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to complete_order_path
    else
      @sum = 0
      render :confirm
    end
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

end
