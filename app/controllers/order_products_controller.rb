class OrderProductsController < ApplicationController

  def new
    @order_product = OrderProduct.new(product_id: params[:product_id])
  end
  def create
    @order = order
    @order_product = OrderProduct.create!(order_id: @order.id, product_id: params["order_product"]["product_id"], quantity: 1)

    redirect_to products_path
    flash[:messages] = "Your product was added to the cart!"
  end

  def update
    @order_product = order.order_products.find_by(product_id: params["order_product"]["product_id"])
    @order_product.update_attributes!(quantity: params[:quantity])
  end

  def destroy
    @order_product = order.order_products.find_by(product_id: params["order_product"]["product_id"])
    @order_product.destroy
  end


  private

  def order
    if session[:order_id]
      Order.find_by(id:session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
      order
    end
  end

end

#combination of things from route, route paramaters, and form paramaters
