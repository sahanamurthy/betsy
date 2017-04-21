class MerchantsController < ApplicationController

  def index
    @Merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    end
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    if @merchant.save
      redirect_to merchants_path
    else
      render :new, status: :bad_request
      flash[:merchant_not_saved] = "Unable to save merchant"
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update

  end


  private
  def merchant_params
    return params.require(:merchant).permit(:name, :username, :email)
  end
end
