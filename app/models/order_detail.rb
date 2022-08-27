class OrderDetail < ApplicationRecord
   belongs_to :order
    enum making_status: {cannot: 0, awaiting: 1, in_production: 2, complete: 3}
    belongs_to :item

    def self.cart_products_total_price(cart_products)
    array = []
    cart_products.each do |cart_product|
      array << cart_product.product.price * cart_product.amount
    end
    return (array.sum * 1.1).floor
    end

    def subtotal
    item.with_tax_price * amount
    end
end
