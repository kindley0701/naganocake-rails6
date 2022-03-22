class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to customer_addresses_path(@address.customer_id)
    else
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to customer_addresses_path(@address.customer_id)
  end

  def destroy
    address = Address.find(params[:id])
    customer = address.customer
    address.delete
    redirect_to customer_addresses_path(customer.id)
  end

  private

  def address_params
    params.require(:address).permit(:zip, :address, :name)
  end
end
