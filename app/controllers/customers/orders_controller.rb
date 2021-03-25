class Customers::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def new
    @order = current_customer.orders.build
    @delivery_addresses = current_customer.delivery_addresses
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @order.postage = 500
    cart_products = current_customer.cart_products
    @order.charge = get_total(cart_products) + @order.postage
    case params[:address_options]
    when "yourOwnAddress" then
      @order.shipping_name = current_customer.full_name
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_prefecture = current_customer.prefecture
      @order.shipping_address = current_customer.address
    when "registeredAddresses" then
      registered_address = DeliveryAddress.find(params[:registered_address])
      @order.shipping_name = registered_address.name
      @order.shipping_postal_code = registered_address.postal_code
      @order.shipping_prefecture = registered_address.prefecture
      @order.shipping_address = registered_address.address
    when "newAddress" then
      @new_delivery_address = current_customer.delivery_addresses.build
      @new_delivery_address.name = params[:order][:shipping_name]
      @new_delivery_address.postal_code = params[:order][:shipping_postal_code]
      @new_delivery_address.prefecture = params[:order][:shipping_prefecture]
      @new_delivery_address.address = params[:order][:shipping_address]
      if @new_delivery_address.save
      else
        @delivery_addresses = current_customer.delivery_addresses.where.not(id: nil)
        render :new
      end
    end
    @cart_products = current_customer.cart_products
  end

  def create
    order = current_customer.orders.build(order_params)
    order.save
    current_customer.cart_products.each do |cart_product|
      order_product = order.order_products.build
      order_product.product_id = cart_product.product_id
      order_product.price = cart_product.product.price
      order_product.quantity = cart_product.quantity
      order_product.save
    end
    current_customer.cart_products.destroy_all
    redirect_to orders_complete_path
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:shipping_name, :shipping_postal_code, :shipping_prefecture, :shipping_address, :postage, :charge, :payment_method, :order_status)
  end

  def get_total(cart_products)
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.product.price
    end
    return (total*1.1).floor
  end
end
