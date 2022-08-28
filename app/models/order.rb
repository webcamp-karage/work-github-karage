class Order < ApplicationRecord

    has_many :order_details
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
    belongs_to :customer
    has_many :items, through: :order_details

  attribute :shipping_cost, default: 800

  def subtotal
    item.with_tax_price * amount
  end

end