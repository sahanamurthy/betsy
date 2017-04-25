class Order < ApplicationRecord
  has_many :order_products

  # validates :name, presence: true
  # validates :email, presence: true
  # validates :address, presence: true
  # validates :cc_name, presence: true
  # validates :cc_number, presence: true
  # validates :cc_expiration, presence: true
  # validates :cc_cvv, presence: true
  # validates :zip_code, presence: true


def show_products(id)
  order = Order.find(id)
  @order_products = OrderProduct.where(order_id: id)
  @product_names = @order_products.map{|item| Product.find_by(id: item.product_id)}

end



end
