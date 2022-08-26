class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @customers = Customer.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path
    else
      render "edit"
    end
    # if @customer == @customer.(is_deleted: true)
    #   reset_session
    #   redirect_to root_path
    # end
  end

  def unsubscribe
  end

  def withdraw
      @customer = current_customer


      @customer.update(is_deleted: true)
      # ログアウトさせる
      reset_session

      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
  end

    private
        def customer_params
            params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_customer_status)
        end

end