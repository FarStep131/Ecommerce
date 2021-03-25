class Customers::DeliveryAddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @delivery_addresses = current_customer.delivery_addresses
  end

  def new
    @delivery_address = current_customer.delivery_addresses.build
  end

  def create
    @delivery_address = current_customer.delivery_addresses.build(delivery_address_params)
    if @delivery_address.save
      redirect_to delivery_addresses_path
    else
      render :new
    end
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(delivery_address_params)
      redirect_to delivery_addresses_path
    else
      render :edit
    end
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to delivery_addresses_path
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit(:name, :postal_code, :prefecture, :address)
  end
end
