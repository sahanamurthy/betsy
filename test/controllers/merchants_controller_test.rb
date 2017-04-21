require "test_helper"

describe MerchantsController do

  describe "index" do
    it "gets index" do
      get merchants_path
      must_respond_with :success
    end

    it "still responds when there are no merchants" do
      Merchant.destroy_all
      get merchants_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "displays a book that exists" do
      merchant = merchants(:one)
      get merchant_path(merchant.id)
      must_respond_with :success
    end
    it "will return 404 if merchant does not exist" do
      get merchant_path(99)
      must_respond_with :not_found
    end
  end

  describe "new" do
    it "checks to make sure being redirected to new_merchants_path" do
      get new_merchants_path
      must_respond_with :success
    end

  end

  describe "create" do
    it "adds merchant to database" do
      merchant = { merchant: { name:"Merchant", username:"merchant1", email:"merchantsarecool@gmail.com" } }
      post merchants_path, params: merchant
      must_redirect_to merchants_path
    end

    it "re-renders merchants form if merchant invalid" do
      merchant = { merchant: { name: "Mark Merchant" } }
      post merchants_path, params: merchant
      must_respond_with :bad_request
    end
  end



  describe "edit" do
  end

  describe "update" do
    it "update an existing merchant" do
      merchant = merchants(:one)
      patch merchant_path(merchant), params: { merchant: { email: "updated@gmail.com" } }
    end
  end

  describe "delete" do

  end

end
