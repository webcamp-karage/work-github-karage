class Public::CartItemsController < ApplicationController
before_action :authenticate_customer!

  def index
    @cart_item = current_customer.cart_items.all
    @total_price = @cart_item.inject(0) { |sum,item| sum + item.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    if CartItem.find_by(item_id: @cart_item.item_id)
      @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      # 追加の数量をカートに入っている数量に足す
      @cart_item.quantity += @update_cart_item.quantity
      @update_cart_item.destroy
    end

    if @cart_item.save
      redirect_to public_cart_items_path
    else
      redirect_to back
    end

  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end


  def all_destroy
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end

end