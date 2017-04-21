require "test_helper"

describe OrdersController do

  describe "index" do
    it "gets index" do
      get orders_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should get show" do
      order = Order.first
      get orders_path(order)
      must_respond_with :success
    end
  end

  describe "new" do
    it "should get new" do
      get new_order_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds an order to the database" do
      order = { order: { name: "Benjamin Franklin", status: "In Progress", email: "bennyfranklin@gmail.com", address: "990 fremont", cc_name: "Benjamin Franklin", cc_number: 102999203, cc_expiration: "1772/02", cc_cvv: 802, zip_code: 99201 } }
      post orders_path, params: order
      must_redirect_to orders_path
    end

    it "render a new order if order is invalid" do
      order = { order: { email: "jjpuffhead@gmail.com"} }
      post orders_path, params: order
      must_respond_with :bad_request
    end
  end

  describe "edit" do
    # it 'should get edit' do
    #   get edit_order_path
    #   must_respond_with :success
    # end
  end

end
