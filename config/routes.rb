Rails.application.routes.draw do
  resources :products, only: [:index, :show, :new, :create] # Include new and create actions.
  get 'cart/show', to: 'cart#show_cart'
  post 'cart/add_to_cart/:id', to: 'cart#add_to_cart', as: 'add_to_cart'
  # ... other routes ...
  root 'products#index'
end
