class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
     @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :is_active, :price, :email, :encrypted_password, :postal_code, :address, :telephone_number)
  end

end
