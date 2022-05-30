class Item < ApplicationRecord
  belongs_to :genre, optional: true
  has_one_attached :image
  has_many :cart_items
  validates :is_active, inclusion: {in: [true, false]}
  validates :genre_id, presence: true
  def add_tax_sales_price
    (self.price * 1.10).round
  end

  def total_price
	  item.price * amount
  end

end
