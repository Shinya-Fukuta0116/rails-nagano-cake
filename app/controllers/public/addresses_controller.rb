class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
   @address = Address.find(params[:id])
    if @address.update
      redirect_to edit_public_address_path
    else
      render :edit
    end
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

  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
