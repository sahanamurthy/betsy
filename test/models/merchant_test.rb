require "test_helper"

describe Merchant do

  describe "associations" do
    it "has many prodcuts" do
      ar = Merchant.reflect_on_association(:products)
      expect(ar.macro) == :has_many
    end
  end

end
