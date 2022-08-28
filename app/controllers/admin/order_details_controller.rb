class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = OrderDetail.find(params[:id])
   if @order_details.update(order_detail_params)
    # (params.require(:order_detail).permit(:making_status))
     # 製作ステイタスを1つでも"制作中"にすると注文ステータスが"制作中"になる。
    case @order_details.making_status
     when "in_production"
      @order_details.order.update(status: "in_production")
     when "complete"
      if @order_details.order.order_details.all?{ |order_detail| order_detail.making_status == "complete" }
       @order_details.order.update(status: "preparing_delivery")
      end
    end# 製作ステータスを全て"製作完了"にすると注文ステータスが"発送準備中"に更新される。

    redirect_to admin_order_path(@order_details.order)
   else
    render 'show'
   end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
