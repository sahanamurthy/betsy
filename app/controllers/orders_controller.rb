class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :bad_request
      flash[:order_not_saved] = "unable to save order"
    end
  end

  def edit
    @order = Order.find(params[:id])
  end



private
  def order_params
    return params.require(:order).permit(:name, :status, :email, :address, :cc_name, :cc_number, :cc_expiration, :cc_cvv, :zip_code)
  end

end
