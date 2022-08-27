class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      redirect_to new_admin_item_path, notice: "大変申し訳ありませんが記入漏れがあります"
    end
  end


  def index
    @item = Item.new
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update!(item_params)
      redirect_to admin_item_path(@item), notice: "無事に更新されました"
    else
    render "edit"
  end
end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end


end