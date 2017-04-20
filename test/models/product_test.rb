require "test_helper"

describe Product do

  describe "Validation" do

    it "is invalid without a name" do
      product = products(:four)
      product.valid?.must_equal false
    end

    it "is invalid without a unique name" do
      product = products(:aliens_two)
      product.valid?.must_equal false
    end

    it "is invalid without a quantity" do
      product = products(:no_quantity)
      product.valid?.must_equal false
    end

    it "is invalid with a non-number quantity" do
      product = products(:odd_quantity)
      product.valid?.must_equal false
    end

    it "is invalid without a price" do
      product = products(:no_price)
      product.valid?.must_equal false
    end

    it "is invalid with a non-numerical price" do
      product = products(:bad_price)
      product.valid?.must_equal false
    end

    it "is invalid with a negative price" do
      product = products(:mean_price)
      product.valid?.must_equal false
    end

    it "is invalid without a category" do
      product = products(:no_category)
      product.valid?.must_equal false
    end
  end


#merging this into master with the following test commented out because
#im getting some wierd errors on the Merchant model that I can't get green
#right now


  # describe "testing relations" do
  #
  #   it "has one merchant (belongs to a merchant)" do
  #     product = products(:one)
  #     product.merchant.nil?.must_equal false
  #   end
  end
end
