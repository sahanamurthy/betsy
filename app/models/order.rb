class Order < ApplicationRecord
  has_many :order_products
  validates :status, presence: true, on: :edit
  validates :name, presence: true, on: :update
  validates :email, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :cc_name, presence: true, on: :update
  validates :cc_number, presence: true, on: :update
  validates :cc_expiration, presence: true, on: :update
  validates :cc_cvv, presence: true, on: :update
  validates :zip_code, presence: true, on: :update


  def show_products(id)
    order = Order.find(id)
    @order_products = OrderProduct.where(order_id: id)
    @product_names = @order_products.map{|item| Product.find_by(id: item.product_id)}
  end

  def close_session_cart
    # if session.id == order_id &&
  end

  def subtract_inventory(id)
    #after update
    product_quantity = {}
    products = Order.find(id).order_products
    products.each do |product|
      product_quantity[product.id] = product.quantity
    end
    product_quantity.each do |product_id, product_quantity|
      if Product.find(product_id).quantity - product_quantity >= 0
        Product.find(product.product_id).quantity -= product_quantity
      end
    end
  end

  def subtotal

  end

  #destroying the cart - will this be tied to order products?
  #order products will have to be destroyed (I think) but it will know
  #by the status being updated? or this is probably in the session logic

end
