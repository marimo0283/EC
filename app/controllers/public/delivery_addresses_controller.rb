class Public::DeliveryAddressesController < ApplicationController
  def index
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = current_customer.delivery_addresses.all
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = current_customer.id
    @delivery_address.save
    redirect_to delivery_addresses_path
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.update(delivery_address_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to delivery_addresses_path
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit(:name, :address, :postal_code)
  end
end
