require "test_helper"

describe MerchantsController do

  describe "index" do
    it "gets index" do
      get merchants_path
      must_respond_with :success
    end



  end
end
