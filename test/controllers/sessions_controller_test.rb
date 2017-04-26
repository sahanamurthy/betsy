require "test_helper"

describe SessionsController do
  #sessions testing

  describe "auth_callback" do
    it"registers a new user" do

    end

    it "accepts a returning user" do
      start_count = Merchant.count
      merchant = merchants(:grace)
     OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(merchant))
     get auth_callback_path(:github)
     must_redirect_to root_path

     session[:merchant_id].must_equal merchant.id, "Merchant was not logged in"

      Merchant.count.must_equal start_count


    end

    it "rejects incomplete auth data" do

    end
  end
end
