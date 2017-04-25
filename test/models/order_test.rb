require "test_helper"

describe Order do

  it "has many order products" do
    ar = Order.reflect_on_association(:order_products)
    ar.macro.must_equal :has_many
  end

  describe "validations" do  #for now skipping but will put in a filter to enact the validations after everything is going through.
    it "requires a name" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :name
    end

    it "requires a email" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :email
    end

    it "requires an address" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :address
    end

    it "requires a cc_name" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :cc_name
    end

    it "requires a cc_expiration" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :cc_expiration
    end

    it "requires a cc_cvv" do
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :cc_cvv
    end

    it "requires a zip_code" do 
      order = Order.create
      result = order.valid?
      result.must_equal false
      order.errors.messages.must_include :zip_code
    end
  end

  describe "show products" do
    it "returns a product name" do
      #I think I have to create an order that also has
      #order products tied to it, then see if the order product
      #winds up returning a product name.
    end

  end

end
