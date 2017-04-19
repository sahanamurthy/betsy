class Order < ApplicationRecord
  has_many :order_products
  belongs_to :session

end
