class Public::CartItemsController < ApplicationController
  def index
    @total_price = my_cart.total_price
    @items = my_cart.items
  end

  def create
    if my_cart.add_item(product_id: params[:product_id], quantity: params[:quantity])
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  def update
    if my_cart.update_item(product_id: params[:product_id], quantity: params[:quantity])
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  def destroy
    if my_cart.delete_item(product_id: params[:product_id])
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  private

  def my_cart
    Cart.find(params[:cart_id])
  end
end
