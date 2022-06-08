class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  #belongs_to :単数。
  validates :item_id, :customer_id, :amount, presence: true
  def add_tax_sales_price
    (self.price * 1.10).round
  end

  def total_price
	  item.price * amount
  end

end
