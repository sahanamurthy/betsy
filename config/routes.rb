Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/merchants', to: "merchants#index", as: 'merchants'
  get '/merchants', to: "merchants#show", as: 'merchant'
end
