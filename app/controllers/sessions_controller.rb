class SessionsController < ApplicationController

  def new
  end

  def create
    merchant = Merchant.find_by(username: params[:username])
	  if merchant
      session[:merchant_id] = merchant.id
      session[:username] = merchant.username
      redirect_to root_path
    else
      render :new_merchant
      # new_merchant = Merchant.create(username: params[:username])
      # session[:merchant_id] = new_merchant.id
      # session[:username] = new_merchant.username
      # flash[:success] = "Successfully created new merchant #{new_merchant.username} with ID #{new_merchant.id}"
      # redirect_to root_path
    end
  end

  def destroy
    session[:merchant_id] = nil
    flash[:logout] = "You're logged out!"
    redirect_to root_path
  end

end
