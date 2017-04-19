require "test_helper"

describe Product do

  describe "Validation" do

      it "is invalid without a name" do
        product = products(:four)
        product.valid?.must_equal false
      end



  end
end
