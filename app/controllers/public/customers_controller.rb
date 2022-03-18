class Public::CustomersController < ApplicationController
  def show
<<<<<<< HEAD
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
=======
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
>>>>>>> 9c8d00f (made page[public(customers#show, customers#edit, customers#confirm), admin(customers#index)])
    else
      render :edit
    end
  end

  def confirm
<<<<<<< HEAD
    @customer = current_customer
  end

  def unsubscribe
    customer = current_customer
=======
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    customer = Customer.find(params[:id])
>>>>>>> 9c8d00f (made page[public(customers#show, customers#edit, customers#confirm), admin(customers#index)])
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last, :first, :zip, :address, :tel, :email)
  end

end
