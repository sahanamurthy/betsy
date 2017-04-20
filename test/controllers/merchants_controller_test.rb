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
    it "should get show" do
      get :show, params: { id: 1 }
      must_respond_with :succes
    end
  end



end
