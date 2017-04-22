Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :merchants
  # get '/merchants', to: "merchants#index", as: 'merchants'
  # get "/merchants/new", to: "merchants#new", as: "new_merchants"
  # post "merchants", to: "merchants#create"
  # get '/merchants/:id/edit', to: "merchants#edit", as: "edit_merchant"
  # patch '/merchants/:id', to: "merchants#update"
  #
  #
  #
  # get '/merchants/:id', to: "merchants#show", as: 'merchant'

end
