class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new

    @product = Product.new
    @merchant = Merchant.first
  end

  def create
   @merchant = Merchant.first
    @product = Product.new(product_params)
    @product.merchant_id = Merchant.first.id
    #temporarily hard-coded worried the underlying form code doesn't work though
    @product.save
    if @product.save
      redirect_to products_path
    else
      render :new, status: :bad_request
      flash[:failure] = "Could not add your product"
      flash[:messages] = @product.errors.messages
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    head :not_found if @product.nil?
  end

  def edit
    @product = Product.find_by(id: params[:id])

  end


  def update
    @merchant = Merchant.find_by(id: 1)
    @product = Product.find_by(id: params[:id])
    @product.update_attributes(product_params)
    @product.save

      if @product.save
        redirect_to product_path(params[:id])
      else
        render :edit, status: :bad_request
      end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    return params.require(:product).permit(:name, :quantity, :category, :price, :description, :merchant_id)
  end
end
