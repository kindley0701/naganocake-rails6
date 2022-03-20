class Public::CartItemsController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @cart_items = @customer.cart_items
    @sum = 0
  end

  def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.amount += CartItem.new(cart_item_params).amount
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to customer_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @customer = @cart_item.customer
    @cart_item.update(cart_item_params)
    redirect_to customer_cart_items_path(@customer.id)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.delete
    redirect_to customer_cart_items_path
  end

  def explode
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to customer_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
