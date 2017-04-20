require "test_helper"

describe OrdersController do

  describe "index" do

    it "gets index" do
      get orders_path
      must_respond_with :success
    end

  end


end
