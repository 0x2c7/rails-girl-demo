class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:add_item, :remove_item]

  def show
  end

  def add_item
    cart_item = current_cart.cart_items.find_or_create_by(
      product_id: @product.id
    )
    cart_item.update(quantity: cart_item.quantity.to_i + 1)

    redirect_to carts_path
  end

  def remove_item
    cart_item = current_cart.cart_items.find_by(
      product_id: @product.id
    )
    if cart_item.quantity.to_i > 1
      cart_item.update(quantity: cart_item.quantity.to_i - 1)
    else
      cart_item.destroy
    end

    redirect_to carts_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
