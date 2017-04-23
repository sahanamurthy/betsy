Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/orders', to: "orders#index", as: 'orders'
  get '/orders/new', to: "orders#new", as: 'new_order'
  post '/orders', to: 'orders#create'
  get '/orders/:id/edit', to: "orders#edit", as: 'edit_order'
  get '/orders/:id', to: "orders#show", as: 'order'
  patch '/orders/:id', to: 'orders#update'
  delete 'orders/:id', to: 'orders#destroy'


  get '/merchants', to: "merchants#index", as: 'merchants'
  get "/merchants/new", to: "merchants#new", as: "new_merchants"
  post "merchants", to: "merchants#create"
  get '/merchants/:id/edit', to: "merchants#edit", as: "edit_merchant"
  patch '/merchants/:id', to: "merchants#update"

  get '/merchants/:id', to: "merchants#show", as: 'merchant'


end
