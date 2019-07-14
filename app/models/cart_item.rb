class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, uniqueness: { scope: :cart_id }

  def sub_total_price
    product.price * quantity.to_i
  end
end
