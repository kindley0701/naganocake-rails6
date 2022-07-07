class Public::ItemsController < ApplicationController

  def index
    @items = params[:genre_id].present? ? Genre.find(params[:genre_id]).items : Item.all
    #viewで指定したパラメータgenre_idが存在すれば，genre_idで絞り込み．存在しなければ全商品取得．
    @genres = Genre.all
  end


  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
  end

end
