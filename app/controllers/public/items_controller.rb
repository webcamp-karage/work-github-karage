class Public::ItemsController < ApplicationController
  def index
    if (params[:genre_id]).present?
      @items =Item.where(genre_id: params[:genre_id])
    else
      @items =Item.all
    end

    if (params[:genre_name]).present?
      @itme_name = params[:garame_name]
    else
      @itme_name = "商品"
    end

  @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
