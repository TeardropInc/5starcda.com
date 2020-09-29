Rails.application.routes.draw do
  resources :payments, only: [:new, :create]
  resources :quotes, only: :create
  root :to => "high_voltage/pages#show", id: "homepage"
end
