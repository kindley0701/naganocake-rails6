class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
    @customer = current_customer
  end

end
