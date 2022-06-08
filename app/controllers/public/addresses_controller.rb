class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @addresses = Address.all
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path
    else
      render 'index'
    end

  end

  def update
    @addresses = Address.all
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses
    else
      render 'index'
    end

  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path

  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
