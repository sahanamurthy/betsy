class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
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
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    end
  end

  def update
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    else
      @merchant.update_attributes(merchant_params)
      if @merchant.save
        redirect_to merchant_path(@merchant)
        flash[:messages] = "Merchant # #{@merchant.id} has been updated"
      else
        render :edit, status: :bad_request
      end
    end
  end

  def show
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    end
  end

  def destroy
    @merchant = Merchant.find_by(id: params[:id])
    if @merchant.nil?
      head :not_found
    else
      @merchant.destroy
      redirect_to merchants_path
    end
  end

  def orders
    @orders = []
    merchant = Merchant.find_by(id: params[:id])
    merchant.products.each do |product|
      product.order_products.each do |order_product|
        @orders.push order_product.order
      end
    end
    return @orders.uniq
  end

  private
  def merchant_params
    return params.require(:merchant).permit(:name, :username, :email)
  end
end
