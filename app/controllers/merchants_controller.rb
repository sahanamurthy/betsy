class MerchantsController < ApplicationController

  def index
    Merchants.all 
  end

end
