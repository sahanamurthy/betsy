class Product < ApplicationRecord
  belongs_to :merchant
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :category, presence: true
  #TODO We need to figure out how to add a column for pictures

end
