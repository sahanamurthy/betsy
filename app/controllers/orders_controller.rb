class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    #finding the Order object with the id from url:
        #Current test url:('localhost/:3000/orders/4')
        #Order #4  has Order-Products associated with it in the db
    @order = Order.find(params[:id])
    #an array of order-products associated with the Order
        #order #4
    @product_names = @order.show_products(@order.id)
    #TODO THIS NEEDS TO BE TESTED
  end

  def new
    @order = Order.new(status: "pending")
    # @order.status = "pending"
  end

  def create
    @order = Order.create(order_params)
    @order.save 
    # if @order.save
    #   @order.status = "paid"
    #   redirect_to order_summary_path(@order)
    # else
    #   render :new, status: :bad_request
    #   flash[:order_not_saved] = "unable to save order"
    end
  end

  def edit
    @order = Order.find_by(id: params[:id])
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.update_attributes(order_params)
    # @order.status = "paid"
    # @order.save
      if @order.save
        @order.status = "paid"
        redirect_to order_summary_path(@order)
      else
        render :edit, status: :bad_request
        flash[:order_not_saved] = "unable to save order"
      end
      @order.close_session_cart
  
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  def order_summary
    @order = Order.find(params[:id])
    @product_names = @order.show_products(@order.id)

  end

private
  def order_params
    return params.require(:order).permit(:name, :status, :email, :address, :cc_name, :cc_number, :cc_expiration, :cc_cvv, :zip_code)
  end

  def close_session_cart
    session[:order_id] = nil if self.status == "paid"

  end

end
