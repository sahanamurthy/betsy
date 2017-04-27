class Order < ApplicationRecord
  has_many :order_products
  validates :status, presence: true, on: :update
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



  def subtract_inventory

  end

  def subtotal

  end

  #destroying the cart - will this be tied to order products?
  #order products will have to be destroyed (I think) but it will know
  #by the status being updated? or this is probably in the session logic



end
