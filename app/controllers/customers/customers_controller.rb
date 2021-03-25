class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    customer = current_customer
    customer.update(is_active: false)
    sign_out current_customer
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :given_name, :family_name_kana, :given_name_kana,:email, :postal_code, :prefecture, :address, :email, :phone_number, :is_active)
  end
end
