class Admin::CustomersController < ApplicationController

  def new
    @customers = Customer.all
  end

  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to public_customer_path(@customer)
    else
      render "new"
    end
  end

  def show
    @customer = Customer.find(params[:id])

  end

  def edit
  end

  def update
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :is_active, :price, :email, :encrypted_password, :postal_code, :address, :telephone_number)
    end
end
