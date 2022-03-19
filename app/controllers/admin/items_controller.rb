class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
<<<<<<< HEAD
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
=======
    @item.save
    redirect_to admin_item_path(@item.id)
>>>>>>> d8285dd (made page[public(items#index), admin(genres#index, genres#edit, items#index, items#new, items#show)])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :caption, :genre_id, :unit_price, :is_active)
  end
end
