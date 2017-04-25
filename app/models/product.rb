class Product < ApplicationRecord
  belongs_to :merchant
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews
  has_and_belongs_to_many :categories


  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: true
  validates :price, presence: true, numericality: {greater_than: 0}

after_initialize :defaults

  def defaults
      self.img_url = "http://loremflickr.com/320/240/puppy"  if self.img_url.nil?
  end

  def self.by_merchant(id)
    Product.where(merchant_id: id)
  end

  def add_category(id)
    self.categories << Category.find(id)
  end
end
