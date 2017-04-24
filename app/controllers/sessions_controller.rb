class SessionsController < ApplicationController
  def auth_callback
    auth_hash = request.env['omniauth.auth']

    merchant = Merchant.from_github(auth_hash)

    if merchant.save
      session[:merchant_id] = merchant.id
      flash[:message] = "Successfully logged in as merchant #{merchant.username}"
    else
      flash[:message] = "Could not log in"
      user.errors.messages.each do |field, problem|
        flash[:field] = problem.join(", ")
      end
    end
    redirect_to root_path
  end

  def logout
   session[:merchant_id] = nil
   flash[:result_text] = "Successfully logged out"
   redirect_to root_path
 end
end
