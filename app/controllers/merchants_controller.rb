class MerchantsController < ApplicationController

  def index
    @Merchants = Merchant.all
  end

  def show

  end 
end
