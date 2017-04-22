class OrderProductsController < ApplicationController

  def create
    @order = order
    @order_product = OrderProduct.create!(order_id: @order.id, product_id: params[:product_id], quantity: 1)
  end

  def update
    @order_product = order.order_products.find_by(product_id: params[:product_id])
    @order_product.update_attributes!(quanity: params[:quantity])
  end

  def destroy
    @order_product = order.order_products.find_by(product_id: params[:product_id])
    @order_product.destroy
  end


  private

  def order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      order = Order.create
      session[:order_id] = order.id
      order
    end
  end

end

#combination of things from route, route paramaters, and form paramaters
