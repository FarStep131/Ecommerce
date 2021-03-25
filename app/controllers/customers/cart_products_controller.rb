class Customers::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_products = current_customer.cart_products
  end

  def create
    cart_product = current_customer.cart_products.build(product_id: params[:product_id])
    byebug
    if current_customer.cart_products.find_by(product_id: cart_product.product_id)
      exsisting_cart_product = current_customer.cart_products.find_by(product_id: cart_product.product_id)
      exsisting_cart_product.quantity += 1
      exsisting_cart_product.save
    else
      cart_product.save
    end
    redirect_to cart_products_path
  end

  def increase
    cart_product = CartProduct.find(params[:cart_product_id])
    cart_product.quantity += 1
    cart_product.save
    redirect_to cart_products_path
  end

  def decrease
    cart_product = CartProduct.find(params[:cart_product_id])
    cart_product.quantity -= 1
    cart_product.save
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    cart_products = current_customer.cart_products
    cart_products.destroy_all
    redirect_to request.referer
  end
end
